class User < ApplicationRecord 
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birth_date, presence: true

  validate :password_complexity

  private

  def password_complexity
    if password.present?
      # 英字のみ
      errors.add(:password, 'は少なくとも1つの数字を含む必要があります') unless password.match(/[a-zA-Z]/)
      
      # 数字のみ
      errors.add(:password, 'は少なくとも1つの英字を含む必要があります') unless password.match(/\d/)
      
      # 全角文字を含む
      errors.add(:password, 'は全角文字を含んではいけません') if password.match(/[^\x01-\x7E]/)
    end
  end
end




