if Rails.env.development? || Rails.env.production?

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           '587',
    authentication: :plain,
    user_name:      'joshcone@googlemail.com',
    password:       'Puppydog123',
    domain:         'gmail.com',
    openssl_verify_mode: 'none'
  }
end
