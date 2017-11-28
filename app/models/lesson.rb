class Lesson < ApplicationRecord
  belongs_to :company

  validates :name, presence: true
  validates_format_of :name, format: { with: /([a-z0-9])/i }
end
