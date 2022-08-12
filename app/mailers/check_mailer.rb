class CheckMailer < ApplicationMailer

  def check_mail(picture)
    @picture = picture

    mail to: @picture.user.email, subject: "投稿内容のご確認"
  end
end
