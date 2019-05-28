3.times do
  board = Board.create(
    board_name: Faker::Team.creature
  )

  3.times do
    list = List.create(
      list_name: Faker::Team.name,
      board_id: board.id
    )

    3.times do
      task = Task.create(
      task_name: Faker::Team.state,
      description: Faker::Team.sport,
      list_id: list.id
    )
    end
  end
end

puts "Created 3 boards with 3 list with 3 tasks."