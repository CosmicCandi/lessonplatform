planlevel = PlanLevel.all
if planlevel.length.nil? || planlevel.length < 6
  PlanLevel.create(
    [
      { name: 'Legacy' },
      { name: 'Custom' },
      { name: 'Basic' },
      { name: 'Plus' },
      { name: 'Growth' },
      { name: 'Enterprise' }
    ]
  )
end