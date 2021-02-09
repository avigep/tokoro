class Place < ApplicationRecord
  belongs_to :user
  has_many :shares, dependent: :destroy

  has_many :shared_with, through: :shares, foreign_key: 'shared_with_id', class_name: 'User'

  validates :name, presence: true
  validates :lat , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  self.per_page = 10

  def save_with_share(share_emails)
    save && update_shared_with(share_emails)
  end

  def update_shared_with(share_emails)
    share_emails.map do |user_email|
      shared_with_user = User.find_by(email: user_email)
      next unless shared_with_user.present?

      Share.create!(
        shared_with: shared_with_user,
        shared_by: user,
        place: self
      )
    end
  end
end
