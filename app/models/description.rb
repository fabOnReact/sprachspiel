class Description < ApplicationRecord
   belongs_to :building
   scope :text, -> { find_by(name: "room-description").content }
   scope :title, -> { find_by(name: "room-title").content }
end
