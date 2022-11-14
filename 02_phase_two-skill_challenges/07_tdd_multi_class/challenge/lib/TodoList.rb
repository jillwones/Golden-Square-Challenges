# frozen_string_literal: true

class TodoList
  def initialize
    @todo_list = []
  end

  # TODO: is an instance of Todo
  def add(todo)
    # Returns nothing
    raise 'Item not a Todo' unless todo.is_a? Todo

    @todo_list << todo
  end

  def list_all
    # Returns all todo tasks
    all_todos = @todo_list.map(&:task)
    all_todos.empty? ? 'No todos in todolist' : all_todos
  end

  def incomplete
    # Returns all non-done todos
    incompleted_tasks = @todo_list.select { |todo| todo.done? == false }.map(&:task)
    return 'No incomplete todos' if incompleted_tasks.empty?

    incompleted_tasks.join(', ')
  end

  def complete
    # Returns all complete todos
    completed_tasks = @todo_list.select { |todo| todo.done? == true }.map(&:task)
    completed_tasks.empty? ? 'No complete todos' : completed_tasks.join(', ')
  end

  def give_up!
    # Marks all todos as complete
    raise 'No todos to give up on!' if @todo_list.empty?

    @todo_list.each { |todo| todo.mark_done unless todo.done? }
  end
end
