namespace :seed do

  def fetch(url, full = false)
    url = Rails.application.config.joindin_api_endpoint + url unless full
    JSON.parse(RestClient.get(url).body)
  end

  def build_event(event)
    {
      name: event["name"],
      description: event["description"],
      start_date: DateTime.parse(event["start_date"]).strftime("%Y-%m-%d"),
      end_date: DateTime.parse(event["end_date"]).strftime("%Y-%m-%d"),
      address: event["location"],
      organizer: User.first,
      talks: []
    }
  end

  def build_talk(talk)
    {
      title: talk["talk_title"],
      description: talk["talk_description"],
      topic: ["Programming", "Databases", "Servers", "Behavior"].sample
    }
  end

  def build_speaker(speaker)
    {
      name: speaker["full_name"],
      twitter_username: speaker["twitter_username"],
      email: Faker::Internet.email,
      image_uri: "http://gravatar.com/avatar/#{speaker["gravatar_hash"]}?size=400",
      bio: Faker::Lorem.sentence
    }
  end

  def create_speaker(name)
    {
      name: name,
      twitter_username: Faker::Twitter.user[:screen_name],
      email: Faker::Internet.email,
      image_uri: Faker::LoremPixel.image("400x400"),
      bio: Faker::Lorem.sentence
    }
  end

  desc "Imports Conferences Data from Joindin"
  task conferences_joindin_data: :environment do
    Rails.logger = Logger.new(STDOUT)
    response = fetch("/events?filter=upcoming")
    response["events"].collect do |event|
      new_event = Conference.new(build_event(event))

      new_event.image_uri = event["images"]["orig"]["url"] if event["images"].length != 0
      new_event.url = event["href"].nil? ? Faker::Internet.url : event["href"]
      new_event.location = Location.all.sample

      puts new_event.errors.inspect if !new_event.valid?

      new_event.save

      talks_response = fetch(event["talks_uri"], true)

      new_event.talks = talks_response["talks"].collect do |talk|
        new_talk = Talk.new(build_talk(talk))
        if !talk["speakers"].empty? && talk["speakers"].first["speaker_uri"]
          speaker_response = fetch("#{talk["speakers"].first["speaker_uri"]}?verbose=yes", true)["users"].first
          new_speaker_build = build_speaker(speaker_response)
        elsif !talk["speakers"].empty?
          new_speaker_build = create_speaker(talk["speakers"].first["speaker_name"])
        else
          new_speaker_build = create_speaker(Faker::Name.name)
        end

        new_speaker = User.find_or_initialize_by(name: new_speaker_build[:name])
        new_speaker.assign_attributes(new_speaker_build)
        new_speaker.save
        new_talk.speaker = new_speaker
        new_talk.conference = new_event

        puts new_talk.errors.inspect if !new_talk.valid?
        
        new_talk.save
        new_talk
      end

      new_event.save
    end
  end
end
