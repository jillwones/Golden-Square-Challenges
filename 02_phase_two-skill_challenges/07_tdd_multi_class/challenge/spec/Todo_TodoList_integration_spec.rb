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
    it 'returns 0 if todos present but all completed' do
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo1.mark_done
      todo_list.add(todo1)
      expect(todo_list.incomplete).to eq('No incomplete todos')
    end
    it 'returns the 3 incompletes if 3 todos and all incomplete' do 
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
  describe '#complete' do 
    it 'returns 0 if todos present but all incomplete' do
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo_list.add(todo1)
      expect(todo_list.complete).to eq('No complete todos')
    end
    it 'returns the 2 completes if 3 todos and 2 marked as done' do 
      todo_list = TodoList.new 
      todo1 = Todo.new('Wash clothes')
      todo2 = Todo.new('Walk the dog')
      todo3 = Todo.new('Go shopping')
      todo1.mark_done
      todo2.mark_done
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      expect(todo_list.complete).to eq('Wash clothes, Walk the dog')
    end
  end
  describe '#give_up!' do 
    it 'marks 3 incomplete tasks as complete' do 
      todo_list = TodoList.new
      todo1 = Todo.new('Wash clothes')
      todo2 = Todo.new('Walk the dog')
      todo3 = Todo.new('Go shopping')
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      expect(todo_list.complete).to eq('No complete todos')
      todo_list.give_up!
      expect(todo_list.complete).to eq('Wash clothes, Walk the dog, Go shopping')
    end
    it 'when 4 todos, 2 already complete, it will mark the other 2 complete' do 
      todo_list = TodoList.new
      todo1 = Todo.new('Wash clothes')
      todo2 = Todo.new('Walk the dog')
      todo3 = Todo.new('Go shopping')
      todo4 = Todo.new('Hoover')
      todo_list.add(todo1)
      todo_list.add(todo2)
      todo_list.add(todo3)
      todo_list.add(todo4)
      todo1.mark_done
      todo2.mark_done
      expect(todo_list.complete).to eq('Wash clothes, Walk the dog')
      todo_list.give_up!
      expect(todo_list.complete).to eq('Wash clothes, Walk the dog, Go shopping, Hoover')
    end
  end
end