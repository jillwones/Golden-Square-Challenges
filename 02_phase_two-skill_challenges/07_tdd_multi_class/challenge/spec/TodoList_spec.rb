require 'TodoList'

describe TodoList do 
  describe '#add' do 
    it 'fails when given an arg that is not an instance of Todo' do 
      todo_list = TodoList.new 
      expect{ todo_list.add(123) }.to raise_error('Item not a Todo')
    end
  end
  describe '#list_all' do 
    it 'return 0 if no todos present' do 
      todo_list = TodoList.new 
      expect(todo_list.list_all).to eq('No todos in todolist')
    end
  end
  describe '#incomplete' do 
    it 'returns 0 if no todos present' do
      todo_list = TodoList.new 
      expect(todo_list.incomplete).to eq('No incomplete todos')
    end
  end
  describe '#complete' do 
    it 'returns 0 if no entries present' do
      todo_list = TodoList.new 
      expect(todo_list.complete).to eq('No complete todos')
    end
  end
  describe '#give_up!' do
    it 'fails if called but no todos to give up on' do 
      todo_list = TodoList.new
      expect{ todo_list.give_up! }.to raise_error('No todos to give up on!')
    end
  end
end