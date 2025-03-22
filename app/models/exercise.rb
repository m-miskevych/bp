class Exercise < ApplicationRecord
  extend Mobility
  translates :name, type: :string, fallbacks: { sk: :en }
  translates :description, type: :text, fallbacks: { sk: :en }

  has_many :exercises_plans
  has_many :plans, through: :exercises_plans

  # has_many_attached :images
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 150, 150 ]
    attachable.variant :normal, resize_to_limit: [ 800, 800 ]
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :set, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :repetition, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validate :validate_youtube_url, if: -> { video_url.present? }

  def youtube_embed_url
    return nil if video_url.blank?

    youtube_id = extract_youtube_id(video_url)
    "https://www.youtube.com/embed/#{youtube_id}" if youtube_id
  end

  private
  def extract_youtube_id(url)
    regex = %r{(?:youtube\.com/(?:watch\?v=|embed/)|youtu\.be/)([\w-]+)}
    match = url.match(regex)
    match[1] if match
  end

  def validate_youtube_url
    unless extract_youtube_id(video_url)
      errors.add(:video_url, :invalid_youtube_url)
    end
  end
end
