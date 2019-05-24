class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validate :year_released
  validates :artist_name, presence: true

  private
  def year_released
    if released
      if release_year == nil
        errors.add(:release_year, "Please specified the year of release.")
      elsif release_year > Time.now.year
        errors.add(:release_year, "Enter a valid release year.")
      end
    end
  end
end
