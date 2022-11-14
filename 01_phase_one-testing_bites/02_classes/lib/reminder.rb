class Reminder
  def initialize(name)
    @name = name 
  end 

  def remind_me_to(task)
    @task = task 
  end 

  def remind()
    return "#{@task}, #{@name}!"
  end 
end 