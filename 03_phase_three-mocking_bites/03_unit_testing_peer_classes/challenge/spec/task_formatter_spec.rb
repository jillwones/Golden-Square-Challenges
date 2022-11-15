# frozen_string_literal: true

require 'task_formatter'

describe TaskFormatter do
  context 'formatting' do
    it 'shows x when tasks when done' do
      task_list = double(:TaskList)
      task_1 = double(:task, title: 'Walk the dog')
      allow(task_1).to receive(:complete?).and_return(true)
      formatted_task = TaskFormatter.new(task_1)
      expect(formatted_task.format).to eq('- [x] Walk the dog')
    end
    it 'shows nothing when tasks when not done' do
      task_list = double(:TaskList)
      task_1 = double(:Task, complete?: false, title: 'Walk the dog')
      formatted_task = TaskFormatter.new(task_1)
      expect(formatted_task.format).to eq('- [ ] Walk the dog')
    end
  end
end
