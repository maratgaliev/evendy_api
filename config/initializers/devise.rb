Devise.setup do |config|
  config.mailer_sender = 'feedback@evendy.ru'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.navigational_formats = [:json]
  config.remember_for = 1.year
  config.jwt do |jwt|
    jwt.expiration_time = 3600000
    jwt.secret = Rails.application.secrets.secret_key_base
    jwt.dispatch_requests = [
      ['POST', %r{^/users/sign_up$}]
    ]
  end
end
