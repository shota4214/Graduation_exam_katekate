class ContactMailer < ApplicationMailer
  def comment_mail(comment)
    @comment = comment
    mail to: @comment.email, subject: "katekate コメント通知メール"
  end

  def message_mail(massage)
    @message = message
    mail to: @message.email, subject: "katekate メッセージ通知メール"
  end
end
