class TalkSerializer < ActiveModel::Serializer
  attributes :id, :conference_id, :conference, :description, :speaker_id, :speaker, :title, :topic
end
