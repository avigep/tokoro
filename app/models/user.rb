class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :places
  has_many :shares_by_me, foreign_key: 'shared_by', class_name: 'Share'
  has_many :shared_with_me, foreign_key: 'shared_with', class_name: 'Share'
  has_many :shared_places, through: :shares_by_me, source: :place, class_name: 'Place'
  has_many :places_shared_with, through: :shared_with_me, source: :place, class_name: 'Place'

  scope :all_except, ->(user) { where.not(id: user) }

  self.per_page = 15

  def public_places
    places.where(public: true)
  end
end
