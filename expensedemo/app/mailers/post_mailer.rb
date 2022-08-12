class PostMailer < ApplicationMailer

  default :from => Rails.application.credentials[Rails.env.to_sym][:cred][:email]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.approved.subject
  #
  def approved(user)
    @user = user
    @greeting = "Hi"
    @entries = ExpEntry.all

    mail(
      from: "report@expense.com",
      to: "himanshu.kumar@go-yubi.com",
      subject: "expance report"
    )
  end
end
