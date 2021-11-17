class User < ApplicationRecord 
    validates :username, :password_digest, :session_token, presence: true 
    validates :username, :session_token, uniqueness: true 
    validates :password, length: {minimum: 6}, allow_nil: true
    
    attr_reader :password 
    after_initialize :ensure_session_token 

    def ensure_session_token 
        self.session_token ||= SecureRandom::urlsafe_base64 
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

end