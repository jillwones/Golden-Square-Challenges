require 'Menu'

describe Menu do 
  context 'when initialised' do 
    it 'creates an instance of Menu' do 
      burger_restaurant = Menu.new(Kernel)
      expect(burger_restaurant).to be_an_instance_of(Menu)
    end
  end

  describe '#menu' do 
    it 'returns the value of the instance variable @menu' do 
      burger_restaurant = Menu.new(Kernel)
      expected =  [
      { name: 'burger', price: 4.50, quantity: 10 },
      { name: 'hot dog', price: 3.00, quantity: 10 },
      { name: 'CocaCola', price: 1.00, quantity: 5 },
      { name: 'chips', price: 2.00, quantity: 1 }
      ]
      expect(burger_restaurant.menu).to eq(expected)
    end

    context 'when all quantities > 0' do 
      it 'putses all of the items in the menu' do 
        fake_terminal = double(:terminal)
        expect(fake_terminal).to receive(:puts).with("Items in stock:")
        expect(fake_terminal).to receive(:puts).with("1. burger - £4.50")
        expect(fake_terminal).to receive(:puts).with("2. hot dog - £3.00")
        expect(fake_terminal).to receive(:puts).with("3. CocaCola - £1.00")
        expect(fake_terminal).to receive(:puts).with("4. chips - £2.00")

        burger_restaurant = Menu.new(fake_terminal)
        burger_restaurant.list_available
      end
    end

    context 'when some quantities < 0' do 
      it 'putses only the available items' do 
        
        # have to create a double of an order
        # and add chips to that order
        # then expect the list_available to not include
        # chips
        
      end
    end
  end
end