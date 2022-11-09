class TodoList
  def initialize
    @todolist = []
  end 

  def add(todo) 
    @todolist << todo 
  end

  def completed(todo)
    raise 'This task is not on your todo list.' if !@todolist.include? todo
    @todolist.delete(todo)
  end

  def list 
    return 'List is currently empty' if @todolist.empty?
    puts "Current TODOS:"
    @todolist.each do |todo|
      puts "* #{todo}"
    end
  end   
end