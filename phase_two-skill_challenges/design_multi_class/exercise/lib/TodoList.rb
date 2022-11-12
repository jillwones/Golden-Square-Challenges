class TodoList
  def initialize
    @todo_list = []
  end
  
  def add(todo)
    # todo is an instance of Todo
    # adds the todo to @todo_list
    # returns nothing
    @todo_list << todo
  end

  def mark_done(todo)
    # todo is an instance of Todo
    # removes the todo from @todo_list
    # raises error if that todo is not in the list
    # returns nothing
    raise 'Todo not on the list' unless @todo_list.include? todo
    @todo_list.delete(todo)
  end
  
  def list_all
    # will puts todo's like: ["Todos:", "* Walk the dog", "* Do homework"].join("\n") + "\n"
    raise 'Todolist empty' if @todo_list.empty?
    puts 'All TODOS:'
    @todo_list.each { |todo| puts "* #{todo.task}"}
  end
end