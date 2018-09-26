ActionMailer::Base.smtp_settings = {
  enable_starttls_auto: true,
  address: 'smtp.gmail.com',
  port: 587,
  domain: "gmail.com",
  authentication: :login,
  user_name: 'aaa',
  # password: '' ---> check notes!
}
