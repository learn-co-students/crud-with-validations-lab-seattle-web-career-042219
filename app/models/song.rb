class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: [true, false]
  validates :release_year, presence: true, numericality: {less_than: Date.today.year.to_i+1}, if: Proc.new { |a| a.released }

end
