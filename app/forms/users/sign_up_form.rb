Users::SignUpForm = Dry::Validation.Form do
  configure do

    def email?(value)
      !Devise.email_regexp.match(value).nil?
    end

    def phone?(value)
      !User.exists?(phone: value)
    end

    def password?(value)
      value.length.in?(Devise.password_length)
    end
  end

  required(:email).filled(:str?, :email?)
  required(:name).filled(:str?)
  required(:phone).filled(:str?, :phone?)
  required(:password).filled(:str?, :password?)
end
