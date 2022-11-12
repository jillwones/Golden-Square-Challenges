class Todo
  attr_reader :task
  
  def initialize(task)
    raise 'Task must be a string' unless task.is_a? String
    @task = task
  end
end