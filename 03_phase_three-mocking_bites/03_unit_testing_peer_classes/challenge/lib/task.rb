# frozen_string_literal: true

class Task
  def initialize(title)
    @title = title
    @complete = false
  end

  attr_reader :title

  def mark_complete
    @complete = true
  end

  def complete?
    @complete
  end
end
