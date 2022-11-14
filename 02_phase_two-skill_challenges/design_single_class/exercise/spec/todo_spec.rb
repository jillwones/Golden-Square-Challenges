require 'todo'

describe TodoList do 
  context 'given no todos' do 
    it '#list eturns an empty list' do 
      todo_list = TodoList.new
      expect(todo_list.list).to eq('List is currently empty')
    end 
  end

  context 'when 1 todo is added' do 
    it '#list returns current todo' do  
      todo_list = TodoList.new 
      todo_list.add('Walk the dog')
      expected_output = ["Current TODOS:", "* Walk the dog"].join("\n") + "\n"
      expect{ todo_list.list } .to output(expected_output).to_stdout
    end
  end

  context 'when 2 todos are added' do 
    it '#list returns both todos' do 
      todo_list = TodoList.new 
      todo_list.add('Walk the dog')
      todo_list.add('Do homework')
      expected_output = ["Current TODOS:", "* Walk the dog", "* Do homework"].join("\n") + "\n"
      expect{ todo_list.list } .to output(expected_output).to_stdout
    end
  end 

  context 'when 2 todos are added and 1 is completed' do 
    it '#list returns the 2 remaining todos' do 
      todo_list = TodoList.new 
      todo_list.add('Walk the dog')
      todo_list.add('Do homework')
      todo_list.completed('Walk the dog')
      expected_output = ["Current TODOS:", "* Do homework"].join("\n") + "\n"
      expect{ todo_list.list } .to output(expected_output).to_stdout
    end 
  end

  context 'completing a todo that doesnt exist' do 
    it '#completed fails' do 
      todo_list = TodoList.new 
      todo_list.add('Walk the dog')
      expect{ todo_list.completed('Homework') }.to raise_error 'This task is not on your todo list.'
    end
  end 
end 