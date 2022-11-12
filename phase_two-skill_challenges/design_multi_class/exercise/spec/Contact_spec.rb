# frozen_string_literal: true

require 'Contact'

describe Contact do
  describe '#name' do
    it 'returns the name of the contact' do
      contact_1 = Contact.new('Bob', 37_462_637_421)
      expect(contact_1.name).to eq('Bob')
    end
  end

  describe '#number' do
    it 'returns the number of the contact' do
      contact_1 = Contact.new('Bob', 37_462_637_421)
      expect(contact_1.number).to eq(37_462_637_421)
    end
    context 'when given an 11 integer number' do
      it 'passes' do
        expect(Contact.new('Bob', 37_462_637_421)).to be_an_instance_of(Contact)
      end
    end
    context 'when number is not an 11 digit integer' do
      it 'fails' do
        expect { Contact.new('Bob', 3_746_263) }.to raise_error('Number must be an 11 digit integer')
      end
      it 'fails' do
        expect { Contact.new('Bob', '3746263') }.to raise_error('Number must be an 11 digit integer')
      end
    end
  end
end
