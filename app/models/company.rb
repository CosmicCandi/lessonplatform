class Company < ApplicationRecord
  belongs_to :plan_level
  has_many :lessons

  validates :name, :trial_status, :plan_level, presence: true
  validates :name, length: {minimum: 2, maximum: 254}
end
