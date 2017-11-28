class Company < ApplicationRecord
  belongs_to :plan_level

  validates :name, :trial_status, :plan_level, presence: true
  validates :name, length: {minimum: 2, maximum: 254}
end
