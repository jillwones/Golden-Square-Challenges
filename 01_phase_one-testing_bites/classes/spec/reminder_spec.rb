require 'reminder'

# when writing tests for a class we say Describe classname rather than a string

describe Reminder do 
  it "reminds the user to do a task" do 
    reminder = Reminder.new('Kay')
    reminder.remind_me_to('Walk the dog')
    result = reminder.remind()
    expect(result).to eq('Walk the dog, Kay!')
  end 
end

# dont want to just test individual methods, want to test objects and classes, want to test
# the behaviour of it as a functioning machine, not just each individual method
# performs its task ok