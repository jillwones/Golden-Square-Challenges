class Diary
  def initialize
    @diary = []
  end
  
  def add(entry)
    @diary << entry
  end

  def all
    @diary
  end
end