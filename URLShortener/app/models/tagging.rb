class Tagging < ApplicationRecord
  validates :tag_id, :url_id, presence: true

  belongs_to :topic,
    class_name: :TagTopic,
    primary_key: :id,
    foreign_key: :tag_id

  belongs_to :url,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :url_id
end
