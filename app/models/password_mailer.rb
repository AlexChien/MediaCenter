# E-mails login data to newly created users
# and to users who have requested a new password
class PasswordMailer < ActionMailer::Base
  # E-mail login data to a new user.
  def new_user(name, email, password)
    @subject          = '您在星尚大典媒体中心的密码'
    @body['name']     = name
    @body['password'] = password
    @recipients       = email
    @from             = '星尚大典媒体中心 <enjoyoung_mailer@enjoyoung.cn>'
  end

  # E-mail login data to an exiting user
  # who requested a new password.
  def forgotten(name, email, password)
    @subject          = '您在星尚大典媒体中心的密码'
    @body['name']     = name
    @body['password'] = password
    @recipients       = email
    @from             = '星尚大典媒体中心 <enjoyoung_mailer@enjoyoung.cn>'
  end
end