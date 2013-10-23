class Admin < User
	has_many :blog_posts

  def admin?
    true
  end
end