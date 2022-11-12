# frozen_string_literal: true

class Diary
  def initialize
    @diary = []
  end

  def add(diary_entry)
    @diary << diary_entry
  end

  def all
    raise 'No entries to show' if @diary.empty?

    @diary
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    raise 'You must have 1 or more minutes to read' unless minutes.positive?
    raise 'WPM must be positive' unless wpm.positive?
    raise 'Diary is empty' if @diary.empty?

    hash = {}

    @diary.each { |entry| hash[entry] = entry.reading_time(wpm) }

    sorted_entry_reading_times = hash.select { |_entry, time| time <= minutes }.sort_by { |_entry, time| time }.to_a

    raise 'All entries are too long.' if sorted_entry_reading_times.empty?

    sorted_entry_reading_times[-1][0]
  end

  def check_diary_for_phone_numbers(contacts)
    answer = []
    @diary.each do |entry|
      contacts.contacts.each do |contact|
        answer << "#{entry.title} - #{contact.name} - #{contact.number}" if entry.content.include? contact.number.to_s
      end
    end
    answer_string = answer.join(', ')
    answer_string.empty? ? 'No contacts found in diary' : answer_string
  end
end
