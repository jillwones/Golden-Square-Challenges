require 'Todo'
require 'TodoList'

describe TodoList do 
  describe '#add' do 
    it 'adds an instance of Todo to the TodoList' do 
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo_list.add(todo1)
      expect(todo_list.list_all).to eq(['Wash clothes'])
    end
    it 'adds multiple instances of Todo to the TodoList' do 
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo2 = Todo.new('Walk the dog')
      todo_list.add(todo1)
      todo_list.add(todo2)
      expect(todo_list.list_all).to eq(['Wash clothes','Walk the dog'])
    end
  end
  describe '#incomplete' do 
    it 'returns the 3 incompletes if 3 entries and all incomplete' do 
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo2 = Todo.new('Walk the dog')
      todo3 = Todo.new('Go shopping')
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      expect(todo_list.incomplete).to eq('Wash clothes, Walk the dog, Go shopping')
    end
  end
end