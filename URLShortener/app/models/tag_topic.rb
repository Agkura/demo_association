class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many :taggings,
    class_name: :Tagging,
    primary_key: :id,
    foreign_key: :tag_id

  has_many :urls,
    through: :taggings,
    source: :url

  has_many :visits,
    through: :urls,
    source: :visits

  def popular_links(n = 5)
    data = visits.select('shortened_urls.long_url').group(:url_id).order('COUNT(visits.user_id) DESC').limit(n).count.to_a
    data.map  { |array| [ShortenedUrl.find(array[0]).long_url, array[1]]}
  end

visits.group(:url_id).order('COUNT(visits.user_id) DESC').limit(n).select('shortened_urls.long_url')
end
