companies = Company.all
if companies.length < 5
  Company.create!(
    [
      { name: 'Lord Elrond\'s Glorious Cupcakes',
        trial_status: (Date.today + 10),
        plan_level_id: PlanLevel.find(1).id },
      { name: 'Things are Getting Dicey',
        trial_status: (Date.today + 15),
        plan_level_id: PlanLevel.find(3).id },
      { name: 'The Future is Bright',
        trial_status: (Date.today + 20),
        plan_level_id: PlanLevel.find(6).id },
      { name: 'Lox and Roll Deli',
        trial_status: (Date.today + 25),
        plan_level_id: PlanLevel.find(4).id },
      { name: 'AlbaCORE',
        trial_status: (Date.today + 17),
        plan_level_id: PlanLevel.find(2).id }
    ]
  )
end




