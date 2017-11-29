class Company < ApplicationRecord
  belongs_to :plan_level, optional: true

  has_many :lessons

  validates :name, presence: true
  validates :name, length: {minimum: 2, maximum: 254}
end
