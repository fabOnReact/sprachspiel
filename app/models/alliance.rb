class Alliance < Event
  def allies(user)
    self.users.where.not(id: user).map {|ally| ally.username }.join(', ')
  end
end
