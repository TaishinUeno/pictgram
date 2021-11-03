class User < ApplicationRecord
  validates :name, presence: true
  # メールアドレスの正規表現を追加してください
  validates :email, presence: true, format: { with: /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/ }
  
  # パスワードをアルファベット、数字の混合のみ可能にしてください
  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }
  
  has_secure_password
end
