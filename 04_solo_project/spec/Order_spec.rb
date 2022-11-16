require 'Order'

describe Order do
  context 'when initialised' do
    it 'creates an instance of Order' do
      my_order = Order.new
      expect(my_order).to be_an_instance_of(Order)
    end
  end

  describe '#add' do
    it 'adds an item to the order array' do
      my_order = Order.new
      menu = double(:menu)
      allow(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 1 }])
      my_order.add('burger', menu)
      my_order.add('chips', menu)
      expect(my_order.order).to eq([['burger', 4.5], ['chips', 2.0]])
    end
    it 'fails when adding something that is not on the menu' do
      my_order = Order.new
      menu = double(:menu)
      expect(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                 { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 1 }])
      expect { my_order.add('random', menu) }.to raise_error('Item not on the menu')
    end
    it 'fails when adding something that is out of stock' do
      my_order = Order.new
      menu = double(:menu)
      allow(menu).to receive(:menu).and_return([{ name: 'burger', price: 4.50, quantity: 10 },
                                                { name: 'hot dog', price: 3.00, quantity: 10 }, { name: 'CocaCola', price: 1.00, quantity: 5 }, { name: 'chips', price: 2.00, quantity: 0 }])
      expect { my_order.add('chips', menu) }.to raise_error('Item not in stock')
    end
    it 'after adding the item to the order will reduce the quantity of that item by 1' do
      burger_restaurant = double(:menu, menu: [
                                   { name: 'burger', price: 4.50, quantity: 10 },
                                   { name: 'hot dog', price: 3.00, quantity: 10 },
                                   { name: 'CocaCola', price: 1.00, quantity: 5 },
                                   { name: 'chips', price: 2.00, quantity: 1 }
                                 ])
      my_order = Order.new

      burger_listing = burger_restaurant.menu[0]

      expect(burger_listing).to eq({ name: 'burger', price: 4.5, quantity: 10 })
      my_order.add('burger', burger_restaurant)
      expect(burger_listing).to eq({ name: 'burger', price: 4.5, quantity: 9 })
    end
  end
end
