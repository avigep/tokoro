# == Schema Information
#
# Table name: shares
#
#  id             :bigint           not null, primary key
#  shared_by_id   :bigint           not null
#  shared_with_id :bigint           not null
#  place_id       :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Share < ApplicationRecord

  belongs_to :shared_by, class_name: 'User'
  belongs_to :shared_with, class_name: 'User'
  belongs_to :place
end
