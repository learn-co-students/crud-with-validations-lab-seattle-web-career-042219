class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validate :year_cannot_be_in_future, :same_song_in_year

  def released?
    self.released == true
  end

  def year_cannot_be_in_future
    if release_year.present? && release_year > Date.current.year
      errors.add(:release_year, "can't be in the future")
    end
  end

  def same_song_in_year
    if title.present?
      Song.all.each do |song|
        if self.title == song.title && self.release_year == song.release_year
          errors.add(:title, "can't repeat song title in same year")
        end
      end
    end
  end
end
