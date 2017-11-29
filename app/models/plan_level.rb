class PlanLevel < ApplicationRecord
  has_many :companies

  validates_presence_of :name, required: :true
end
