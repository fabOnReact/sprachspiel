class Alliance < Event
  validates :name, :description, presence: true
end
