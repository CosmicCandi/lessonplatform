Lesson.create(
  [
    { name: 'ThisIsTheNameOfALesson', company_id: Company.find(2).id,
      active: true },
    { name: 'ThisIsTheNameOfALesson2', company_id: Company.find(2).id,
      active: false },
    { name: 'WowAwesomeCool13550N', company_id: Company.find(1).id,
      active: true}
  ]
)