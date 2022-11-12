require 'TodoList'

describe TodoList do 
  describe '#list_all' do 
    it 'fails when todolist empty' do 
      todo_list = TodoList.new
      expect{ todo_list.list_all }.to raise_error('Todolist empty')
    end
  end
end