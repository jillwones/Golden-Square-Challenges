require 'ContactsList'

describe Contacts do 
  describe '#contacts' do 
    it 'returns an empty array when no contacts added' do 
      iphone_list = Contacts.new
      expect(iphone_list.contacts).to eq([])
    end
  end
end