# frozen_string_literal: true

class Contacts
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def add(contact)
    @contacts << contact
  end
end
