class FavoriteMailer < ApplicationMailer
  default from: "josh@googlemail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@powerful-everglades-69910>"
    headers["In-Reply-To"] = "<post/#{post.id}@powerful-everglades-69910>"
    headers["References"] = "<post/#{post.id}@powerful-everglades-69910>"
    @user = user
    @post = post
    @comment = comment

    mail(to: @user.email, subject: "New comment on #{post.title}")
end
end
