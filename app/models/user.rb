class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザー本名のふりがなは全角で入力させる (全角カタカナ) 6/15木下      
  validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/  }
  validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/  }
  
  # ユーザー本名は全角で入力させる(全角ひらがな、全角カタカナ、漢字) 6/15木下
  validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/  }
  validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/  }
  
  # メールアドレス@以降のドメイン必須 6/15木下
  validates :email, format: {with: /\A\S+@\S+\.\S+\z/ }


  
end
