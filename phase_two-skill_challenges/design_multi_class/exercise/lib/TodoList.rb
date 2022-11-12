# frozen_string_literal: true

class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def mark_done(todo)
    raise 'Todo not on the list' unless @todo_list.include? todo

    @todo_list.delete(todo)
  end

  def list_all
    raise 'Todolist empty' if @todo_list.empty?

    puts 'All TODOS:'
    @todo_list.each { |todo| puts "* #{todo.task}" }
  end
end
