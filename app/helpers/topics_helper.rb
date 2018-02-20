module TopicsHelper
  def user_is_authorised_for_topics_post_edit_create?
    current_user && current_user.admin?  || current_user && current_user.moderator? || current_user && current_user.member?
  end

  def user_is_authorised_for_post_delete?
    current_user && current_user.admin? || current_user && current_user.member?
  end
end
