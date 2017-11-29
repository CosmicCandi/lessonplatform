require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "a lesson should have a name" do
    company = Company.create(name: "Sample", id: 1)
    lesson = Lesson.create(name: 'ThisIsSomeText1234', company_id: 1)
    lesson.save
    refute lesson.name.nil?
  end

  test "a lesson requires a company id" do
    company = Company.create(name: "Sample", id: 1)
    lesson = Lesson.create(name: "ThisIsSomeText122334")
    refute lesson.save
    refute lesson.errors.full_messages.nil?
    assert lesson.errors.full_messages.include?("Company must exist")
  end


end
