class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :same_year
  validate :release_year_logic


  private

  def same_year
    duplicate = Song.all.find_by(title: title, artist_name: artist_name, release_year: release_year)
    if duplicate
      errors.add(:title, "is already a title by #{artist_name} released in #{release_year}")
    end
  end

  def release_year_logic
    t = Time.new
    if released == true && release_year.blank?
      errors.add(:release_year, "cannot be empty for a released song.")
    elsif released == true && release_year > t.year
      errors.add(:release_year, "cannot be greater than current year #{t.year}")
    end
  end

end
