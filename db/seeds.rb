

bob = User.create(name: "Bob", email: "bob@email.com", bio: "databases engineer with 67 years of experience in postgres")

tina = User.create(name: "Tina", email: "tina@email.com", bio: "expert at cabybara")

nyc = Location.create(city: "New York", state: "NY")

conf = Conference.create(name: "Flatiron Presents", description: "presenting something cool", url: "https://www.flatironschool.com/", start_date: "2017-12-24", end_date: "2017-12-25", address: "11 Broadway",  location: nyc, organizer: bob)

talk = Talk.create(title: "Heroku 101", description: "a real cool website thingy", topic: "servers", speaker: tina, conference: conf)
