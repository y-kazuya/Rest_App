class Owner < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
###################validates############################################################
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :profile,length: { maximum: 500 }
  validates :born,length: { maximum: 100 }
  validates :age, numericality: {less_than_or_equal_to: 100}, unless: :have_age?
  validates :phone_number , uniqueness: true,numericality:{less_than_or_equal_to: 9999999999999} ,unless: :have_phone_number?
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def have_age?
    age.nil?
  end

  def have_phone_number?
    phone_number.nil?
  end

  def Owner.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムトークン
  def Owner.new_token
    SecureRandom.urlsafe_base64
  end

   # 永続セッションのためにユーザーをデータベースに記憶する
   def remember
    self.remember_token = Owner.new_token
    update_attribute(:remember_digest, Owner.digest(remember_token))
  end


  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end