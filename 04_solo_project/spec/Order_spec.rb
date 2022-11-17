require 'Order'

# test parent-child classes here

describe Order do
  context 'when initialised' do
    it 'creates an instance of Order' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(my_order).to be_an_instance_of(Order)
    end
  end

  describe '#add' do
    it 'adds an item to the order array' do
      menu = double(:menu)
      my_order = Order.new(menu)
      allow(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 1 }])
      my_order.add('burger')
      my_order.add('chips')
      expect(my_order.order).to eq([['burger', 4.5], ['chips', 2.0]])
    end
    it 'fails when adding something that is not on the menu' do
      menu = double(:menu)
      my_order = Order.new(menu)
      expect(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                 { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 1 }])
      expect { my_order.add('random') }.to raise_error('Item not on the menu')
    end
    it 'fails when adding something that is out of stock' do
      menu = double(:menu)
      my_order = Order.new(menu)
      allow(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 0 }])
      expect { my_order.add('chips') }.to raise_error('Item not in stock')
    end
    it 'after adding the item to the order will reduce the quantity of that item by 1' do
      burger_restaurant = double(:menu, menu: [
                                   { name: 'burger', price: 4.50, quantity: 10 },
                                   { name: 'hot dog', price: 3.00, quantity: 10 },
                                   { name: 'CocaCola', price: 1.00, quantity: 5 },
                                   { name: 'chips', price: 2.00, quantity: 1 }
                                 ])
      my_order = Order.new(burger_restaurant)

      burger_listing = burger_restaurant.menu[0]

      expect(burger_listing).to eq({ name: 'burger', price: 4.5, quantity: 10 })
      my_order.add('burger')
      expect(burger_listing).to eq({ name: 'burger', price: 4.5, quantity: 9 })
    end
  end
end
