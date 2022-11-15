# frozen_string_literal: true

class SecretDiary
  def initialize(diary)
    @locked = true
    @diary = diary
  end

  def read
    raise 'Go away!' if @locked

    @diary.read
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end
end
