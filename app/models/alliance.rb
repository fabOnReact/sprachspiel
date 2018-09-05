class Alliance < Event
  self.table_name = "events"
  HEADERS = %w[name description participants join]
  has_many :invites
	belongs_to :chatroom
  # has_many :users, class_name: "User", primary_key: "id", foreign_key: "alliance_id"
end
