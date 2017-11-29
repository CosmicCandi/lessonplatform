require 'test_helper'
require 'pry'

class CompanyTest < ActiveSupport::TestCase
  test "a company has a name" do
    company = Company.new(name: "Visceral Gaming")
    assert company.name
  end

  test "a company with only a name saves" do
    company = Company.new(name: "Visceral Gaming")
    assert company.save
  end

  test "a company requires a name" do
    company = Company.new
    refute company.save
    assert company.errors.full_messages.include?("Name can't be blank")
  end

  test "a company name has to be at least two characters" do
    company = Company.new(name:"V")
    refute company.save
    assert company.errors.full_messages.include?("Name is too short (minimum is 2 characters)")

    company1 = Company.new(name: "Vi")
    assert company1.save
    refute company1.errors.full_messages.include?("Name is too short (minimum is 2 characters)")
  end

  test "a company name must be less than 255 characters" do
    company = Company.new(name: Array.new(255, 'A').to_s)
    refute company.save
    assert company.errors.full_messages.include?('Name is too long (maximum is 254 characters)')
  end

  test "a company has a trial status" do
    company = Company.new(name: "Visceral Gaming", trial_status: Date.today)
    refute company.trial_status.nil?
  end

  test "a company with a trial status saves" do
    company = Company.new(name: "Visceral Gaming", trial_status: Date.today)
    assert company.save
  end

  test "a company optionally does not have a trial status" do
    company = Company.new(name: "Visceral Gaming", trial_status: nil)
    assert company.trial_status.nil?
  end

  test "a company without a trial status still saves" do
    company = Company.new(name: "Visceral Gaming")
    assert company.save
  end

  test "a company has a plan level" do
    plan_level = PlanLevel.create(id: 2, name: 'Two')
    company = Company.new(name: "Visceral Gaming", plan_level_id: plan_level.id)
    assert company.plan_level_id == 2
    assert company.plan_level.name == 'Two'
  end

  test "a company with a plan level saves" do
    plan_level = PlanLevel.create(id: 2, name: 'Two')
    company = Company.new(name: "Visceral Gaming", plan_level_id: plan_level.id)
    assert company.save
  end

  test "a plan level and its details can be accessed through company" do
    plan_level = PlanLevel.create(id: 2, name: 'Two')
    company = Company.new(name: "Visceral Gaming", plan_level_id: plan_level.id)
    assert company.save
    refute company.plan_level.nil?
    refute company.plan_level.name.nil?
  end

end
