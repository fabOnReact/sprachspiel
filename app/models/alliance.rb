class Alliance < Event
  HEADERS = %w[name description participants options]
  has_many :invites
  has_many :users
end
