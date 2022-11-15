# frozen_string_literal: true

require 'task_list'
require 'task'
require 'task_formatter'

RSpec.describe 'tasks integration' do
  it 'adds tasks to a list' do
    task_list = TaskList.new
    task_1 = Task.new('Walk the dog')
    task_2 = Task.new('Walk the cat')
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it 'marks tasks as complete' do
    task_list = TaskList.new
    task_1 = Task.new('Walk the dog')
    task_2 = Task.new('Walk the cat')
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  context 'formatting' do
    it 'shows x when tasks when done' do
      task_list = TaskList.new
      task_1 = Task.new('Walk the dog')
      task_1.mark_complete
      formatted_task = TaskFormatter.new(task_1)
      expect(formatted_task.format).to eq('- [x] Walk the dog')
    end
    it 'shows nothing when tasks when not done' do
      task_list = TaskList.new
      task_1 = Task.new('Walk the dog')
      formatted_task = TaskFormatter.new(task_1)
      expect(formatted_task.format).to eq('- [ ] Walk the dog')
    end
  end
end
