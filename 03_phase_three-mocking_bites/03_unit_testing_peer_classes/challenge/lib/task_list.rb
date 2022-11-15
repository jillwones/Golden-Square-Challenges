# frozen_string_literal: true

class TaskList
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def all
    @tasks
  end

  def all_complete?
    return false if @tasks.empty?

    @tasks.all?(&:complete?)
  end
end
