require "date"

class Todo
  def initialize(text, due_date, completed)
    @text = text
    @due_date = due_date
    @completed = completed
  end

  def due_date
    @due_date
  end

  def to_displayable_string
    todisplay_checkbox = []
    if @completed
      todisplay_checkbox = todisplay_checkbox.push("X")
    else
      todisplay_checkbox = todisplay_checkbox.push(" ")
    end

    
    if @due_date != Date.today
      todisplay_date = due_date
    end
    return "#{todisplay_checkbox.to_s.gsub('"', '')} #{@text} #{todisplay_date} "
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end

  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_date == Date.today })
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.due_date < Date.today })
  end

  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_date > Date.today })
  end

  def add(newObject)
    @todos.append(newObject)
  end

  def to_displayable_list
    @todos.map { |todo| todo.to_displayable_string }
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
