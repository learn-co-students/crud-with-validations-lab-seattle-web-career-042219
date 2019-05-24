class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validate :year_released
    validates :artist_name, presence: true 

    private

    def year_released
        if released
            if release_year == nil
                errors.add(:release_year, "Please specify the year of the release.")
            elsif release_year > Time.now.year
                errors.add(:release_year, "Enter a valid release year.")
            end
        end
    end
end
