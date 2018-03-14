module UsersHelper
  def posts_for_a_user(user)
    user.posts.count > 1
  end
  def comments_for_a_user(user)
    user.comments.count > 1
  end
  def favorites_for_a_user(user)
    user.favorites.count > 1
  end
end
