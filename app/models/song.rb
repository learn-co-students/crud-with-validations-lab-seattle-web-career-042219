require 'pry'
class Song < ApplicationRecord
  validates :title, uniqueness: {scope: :release_year}
  validates :title, :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, allow_nil: true, numericality: {only_integer: true, less_than: 2020}
  # validate :repeat_title
  validate :year_validation



  private
  def repeat_title
    @new_song = Song.find_by(title: self.title)
    #binding.pry
    if @new_song.present?
      if @new_song.artist_name == self.artist_name && @new_song.release_year == self.release_year
        errors.add(:title, "Duplicate Title!")
      end
    end
  end

  def year_validation
    if self.released == true && self.release_year == nil
      errors.add(:release_year, "Need a Release Year")
    end
  end

end
