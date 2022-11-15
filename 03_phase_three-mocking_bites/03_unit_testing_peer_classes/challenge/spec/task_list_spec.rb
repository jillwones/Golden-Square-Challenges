# frozen_string_literal: true

require 'task_list'

RSpec.describe TaskList do
  it 'initially has an empty list' do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it 'is initially not all complete' do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour
  it 'returns all of the tasks in the tasks list' do
    task_list = TaskList.new
    task_1 = double(:task)
    task_2 = double(:task)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq([task_1, task_2])
  end

  describe '#all_complete?' do
    context 'task_list is empty' do
      it 'returns false' do
        task_list = TaskList.new
        expect(task_list.all_complete?).to eq(false)
      end
    end

    context 'if all tasks are complete do' do
      it 'returns true' do
        task_list = TaskList.new
        task_1 = double(:task, complete?: true)
        task_2 = double(:task, complete?: true)
        task_list.add(task_1)
        task_list.add(task_2)
        expect(task_list.all_complete?).to eq(true)
      end
    end

    context 'if not all tasks are complete do' do
      it 'returns false' do
        task_list = TaskList.new
        task_1 = double(:task, complete?: true)
        task_2 = double(:task, complete?: false)
        task_list.add(task_1)
        task_list.add(task_2)
        expect(task_list.all_complete?).to eq(false)
      end
    end
  end
end
