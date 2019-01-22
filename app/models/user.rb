class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :image

  # deviseでemailを不必要にする
  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  has_many :books, dependent: :destroy
  has_many :post_images, dependent: :destroy
end
