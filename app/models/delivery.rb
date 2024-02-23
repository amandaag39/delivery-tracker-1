# == Schema Information
#
# Table name: deliveries
#
#  id                    :integer          not null, primary key
#  arrived               :boolean          default(FALSE)
#  description           :string
#  details               :text
#  supposed_to_arrive_on :date
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Delivery < ApplicationRecord
  # Validate that a user_id is present
  validates :user_id, presence: true
  
  # Validate that a description is present
  validates :description, presence: true
  
  # Validate that a supposed_to_arrive_on date is present
  validates :supposed_to_arrive_on, presence: true
end
