require 'TodoList'

describe TodoList do 
  describe '#add' do 
    it 'fails when given an arg that is not an instance of Todo' do 
      todo_list = TodoList.new 
      expect{ todo_list.add(123) }.to raise_error('Item not a Todo')
    end
  end
  describe '#incomplete' do 
    it 'returns 0 if no entries present' do
      todo_list = TodoList.new 
      expect(todo_list.incomplete).to eq('No incomplete entries')
    end
  end
end