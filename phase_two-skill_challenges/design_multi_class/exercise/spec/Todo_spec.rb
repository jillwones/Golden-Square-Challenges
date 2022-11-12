require 'Todo'

describe Todo do 
  describe '#task' do 
    it 'returns the todo task' do 
      todo_1 = Todo.new('Walk the dog')
      expect(todo_1.task).to eq('Walk the dog')
    end
    it 'fails when passed arg that is not a string' do 
      expect{ Todo.new([123]) }.to raise_error('Task must be a string')
    end
  end
end