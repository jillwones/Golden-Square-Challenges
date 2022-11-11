# frozen_string_literal: true

class Todo
  attr_reader :task

  # task is a string
  def initialize(task)
    raise 'task must be a string' unless task.is_a? String

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
