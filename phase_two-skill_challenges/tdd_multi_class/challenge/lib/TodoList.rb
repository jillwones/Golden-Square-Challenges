class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    raise 'Item not a Todo' if !todo.is_a? Todo
    @todo_list << todo
  end

  def list_all
    # Returns all todo tasks
    @todo_list.map { |todo| todo.task }
  end

  def incomplete
    # Returns all non-done todos
    completed_tasks = @todo_list.select { |todo| todo.done? == false }.map { |todo| todo.task }
    return 'No incomplete entries' if completed_tasks.empty?
    completed_tasks.join(', ')
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end