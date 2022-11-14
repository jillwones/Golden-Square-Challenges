require 'Todo'

describe Todo do 
  describe '#initialize' do 
    it 'fails when passed an arg that is not a string' do 
      expect{ Todo.new([123]) }.to raise_error 'task must be a string'
    end
  end 

  describe '#mark_done' do 
    it 'makes @finished => true' do 
      task = Todo.new('Walk the dog')
      task.mark_done
      expect(task.done?).to eq(true)
    end

    it 'returns error if called on a task thats already done' do 
      task = Todo.new('Walk the dog')
      task.mark_done 
      expect{ task.mark_done }.to raise_error('Task already completed')
    end
  end

  describe '#done?' do 
    it 'returns false when task hasnt been completed yet' do 
      task = Todo.new('Walk the dog')
      expect(task.done?).to eq(false)
    end
    it 'returns true when task has been completed' do 
      task = Todo.new('Walk the dog')
      task.mark_done
      expect(task.done?).to eq(true)
    end
  end
end