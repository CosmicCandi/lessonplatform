class Lesson < ApplicationRecord
  belongs_to :company
  after_create :sanitize_name

  validates :name, presence: true
  validates :name, format: { with: /[a-z0-9]+/i, message: 'Only alphanumerics.'}

  def sanitize_name
    @lesson = self
    @lesson.name = @lesson.name.gsub(/[\W]+/i, "")
    @lesson.save!
    end

  end
