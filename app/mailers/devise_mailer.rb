class ContactMailer < Devise::Mailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "お問合せの確認メール"
  end
end