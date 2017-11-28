class Lesson < ApplicationRecord
  belongs_to :company

  validates :name, format: { with: /([a-z0-9])/i,
    message: 'Letters and numbers only' }
end
