class ContactMailer < ApplicationMailer
  def comment_mail(article_user, comment_user)
    @article_user = article_user
    @comment_user = comment_user
    mail to: @article_user.email, subject: "katekate コメント通知メール"
  end

  def message_mail(recipient_user, sender_user)
    @recipient_user = recipient_user
    @sender_user = sender_user
    mail to: @recipient_user.email, subject: "katekate メッセージ通知メール"
  end

  def send_when_sign_up(email, name)
    @name = name
    mail to: email, subject: 'katekate 新規登録メール'
  end
end
