class TodoList
  def initialize
    # @todo_list = []
  end
  
  def add(todo)
    # todo is an instance of Todo
    # adds the todo to @todo_list
    # returns nothing
  end

  def mark_done(todo)
    # todo is an instance of Todo
    # removes the todo from @todo_list
    # raises error if that todo is not in the list
    # returns nothing
  end
  
  def list_all
    # will puts todo's like: ["Todos:", "* Walk the dog", "* Do homework"].join("\n") + "\n"
  end
end