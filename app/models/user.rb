# email:string
# password_digest:string

# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    
    has_secure_password

    # validates if we really have an email for the user, meaning its more or a less a required field when creating a new user
    # validate the email and the format of the email address
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message:"must be a valid email address" }

end
