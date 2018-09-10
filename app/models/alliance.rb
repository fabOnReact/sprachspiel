class Alliance < Event
	after_create :add_chatroom
  before_save :add_user
  self.table_name = "events"
  HEADERS = %w[name description participants join]
  has_many :invites
	def add_chatroom; Chatroom.create(alliance: self); end
end
