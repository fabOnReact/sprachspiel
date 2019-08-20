class String
  def new_path
    self.pluralize.downcase.concat("/new")
  end
end