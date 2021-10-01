class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :goods, dependent: :destroy
  
  validates :user_name, presence: true
  validates :email, presence: true
  attachment :profile_image

  enum favorite_team: { unspecified: 0, sapporo: 1, hachinohe: 2, morioka: 3, sendai: 4, akita: 5, yamagata: 6, fukushima: 7, kashima: 8, mito: 9, tochigi: 10, gunma: 11, urawa: 12, omiya: 13, chiba: 14, kashiwa: 15, fc_tokyo: 16, tokyo_verdy: 17, machida: 18, kawasaki: 19, marinos: 20, yokohama_fc: 21, yscc_yokohama: 22, sagamihara: 23, shonan: 24, kofu: 25, nagano: 26, matsumoto: 27, niigata: 28, toyama: 29, kanazawa: 30, shimizu: 31, iwata: 32, fujieda: 33, numazu: 34, nagoya: 35, gifu: 36, kyoto: 37, gamba: 38, cerezo: 39, kobe: 40, tottori: 41, okayama: 42, hiroshima: 43, yamaguchi: 44, tokushima: 45, sanuki: 46, ehime: 47, imabari: 48, fukuoka: 49, kitakyushu: 50, tosu: 51, nagasaki: 52, kumamoto: 53, oita: 54, miyazaki: 55, kagoshima: 56, ryukyu: 57, samurai_blue: 58 }
end
