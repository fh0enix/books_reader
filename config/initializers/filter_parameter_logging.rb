
Rails.application.config.filter_parameters += [
  :password,
  :secret,
  :token,
  :_key,
  :crypt,
  :salt,
  :certificate,
  :otp,
  :ssn
]
