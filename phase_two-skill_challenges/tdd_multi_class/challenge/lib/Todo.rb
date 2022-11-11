class Todo
  attr_reader :task
  def initialize(task) # task is a string
    raise 'task must be a string' if !task.is_a? String
    @task = task
    @finished = false
  end

  def mark_done
    # Marks the todo as done
    # Returns nothing
    raise 'Task already completed' if @finished
    @finished = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @finished
  end
end