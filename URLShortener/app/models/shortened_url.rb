class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, :long_url, presence: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :url_id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: url)
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.shorten(user, url)
    short_url = random_code
    ShortenedUrl.create!(user_id: user.id, long_url: url, short_url: short_url)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visitors.where({ created_at: (Time.now - 10.minutes)..Time.now}).count
  end

end
