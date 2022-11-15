# frozen_string_literal: true

class TaskFormatter
  def initialize(task)
    @task = task
  end

  def format
    @task.complete? ? "- [x] #{@task.title}" : "- [ ] #{@task.title}"
  end
end
