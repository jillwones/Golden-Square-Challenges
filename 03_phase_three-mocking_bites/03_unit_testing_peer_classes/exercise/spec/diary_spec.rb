# frozen_string_literal: true

require 'diary'

describe Diary do
  context 'when initialised' do
    it 'generates an instance of Diary' do
      expect(Diary.new('contents')).to be_an_instance_of(Diary)
    end

    it 'fails when arg is not a string' do
      expect { Diary.new([123]) }.to raise_error('Argument must be a string')
    end
  end

  describe '#read' do
    it 'returns the contents of the diary' do
      diary = Diary.new('contents')
      expect(diary.read).to eq('contents')
    end
  end
end
