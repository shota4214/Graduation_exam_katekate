class ContactMailer < ApplicationMailer
  def comment_mail(comment)
    @comment = comment
    mail to: @comment.email, subject: "katekate コメント通知メール"
  end

  def message_mail(recipient_user, sender_user)
    @recipient_user = recipient_user
    @sender_user = sender_user
    mail to: @recipient_user.email, subject: "katekate メッセージ通知メール"
  end
end
