class Movie < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  scope :has_url, -> { where.not(poster_image_url: nil) }

  has_many :reviews

  validates :title, :director, :description, :poster_image_url, :release_date, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }

  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size unless reviews.size == 0
  end

  def self.search(query1, query2)
    # binding.pry
    if query2 == "1"
      range = (0..89)
    elsif query2 == "2"
      range = (90..120)
    end

    if query2 != ""
      if query2 == "3"
        where('title LIKE :query1 OR director LIKE :query1', query1: "%#{query1}%").where("runtime_in_minutes > ?", 120)
      else
        where('title LIKE :query1 OR director LIKE :query1', query1: "%#{query1}%").where(runtime_in_minutes: range)
      end 
    elsif query2 == ""
      where('title LIKE :query1 OR director LIKE :query1', query1: "%#{query1}%")
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
