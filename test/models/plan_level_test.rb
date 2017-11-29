require 'test_helper'

class PlanLevelTest < ActiveSupport::TestCase
  test "a plan level cannot be saved without a name" do
   plan = PlanLevel.new()
   refute plan.save
  end

  test "a plan level has a name" do
    plan = PlanLevel.new(name: "TestPlan")
    refute plan.name.nil?
  end

end
