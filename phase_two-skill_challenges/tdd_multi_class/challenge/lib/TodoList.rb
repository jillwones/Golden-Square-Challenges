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
    all_todos = @todo_list.map { |todo| todo.task }
    all_todos.empty? ? 'No todos in todolist' : all_todos
  end

  def incomplete
    # Returns all non-done todos
    incompleted_tasks = @todo_list.select { |todo| todo.done? == false }.map { |todo| todo.task }
    return 'No incomplete todos' if incompleted_tasks.empty?
    incompleted_tasks.join(', ')
  end

  def complete
    # Returns all complete todos
    completed_tasks = @todo_list.select { |todo| todo.done? == true }.map { |todo| todo.task }
    completed_tasks.empty? ? 'No complete todos' : completed_tasks.join(', ')
  end

  def give_up!
    # Marks all todos as complete
    raise 'No todos to give up on!' if @todo_list.empty?
    @todo_list.each { |todo| todo.mark_done unless todo.done? }
  end
end