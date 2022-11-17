require 'FinishMyOrder'
require 'Menu'
require 'Order'
require 'Text'

describe 'integration' do 
  describe 'looking at the menu' do 
    context 'when all items are in stock' do 
      it 'putses the available items' do 
        burger_restaurant = Menu.new
        expected = ['Items in stock:', '1. burger - £4.50', '2. hot dog - £3.00', '3. CocaCola - £1.00', '4. chips - £2.00'].join("\n") + "\n"
        expect{ burger_restaurant.list_available }.to output(expected).to_stdout
      end
    end

    context 'when some items out of stock' do 
      it 'putses the available items' do 
        burger_restaurant = Menu.new
        my_order = Order.new 
        my_order.add('chips', burger_restaurant)
        expected = ['Items in stock:', '1. burger - £4.50', '2. hot dog - £3.00', '3. CocaCola - £1.00'].join("\n") + "\n"
        expect{ burger_restaurant.list_available }.to output(expected).to_stdout
      end
    end
  end
  describe 'ordering' do 
    it 'adds items and their prices to the order' do 
      burger_restaurant = Menu.new
      my_order = Order.new
      my_order.add('burger', burger_restaurant)
      my_order.add('chips', burger_restaurant)
      expect(my_order.order).to eq([['burger', 4.50],['chips', 2.00]])
    end

    it 'fails when ordering an item not on the menu' do 
      burger_restaurant = Menu.new
      my_order = Order.new
      expect{ my_order.add('random', burger_restaurant) }.to raise_error('Item not on the menu')
    end

    it 'fails when adding an item that is out of stock' do 
      # as quantity of chips on menu is initialized as 1
      # you should be able to add 1 portion of chips to the
      # order with no issues, but then the quantity is now 0
      # so if you try to add another portion an error is raised
      burger_restaurant = Menu.new
      my_order = Order.new
      expect{ my_order.add('chips', burger_restaurant) }.not_to raise_error
      expect{ my_order.add('chips', burger_restaurant) }.to raise_error('Item not in stock')
    end
  end

  describe 'receipt' do 
    it 'shows the prices of the ordered items and the grand total' do 
      burger_restaurant = Menu.new
      my_order = Order.new
      my_order.add('burger', burger_restaurant)
      my_order.add('chips', burger_restaurant)
      finish_my_order = FinishMyOrder.new(my_order, Kernel)
      expected = ['What you ordered:', 'burger - £4.50', 'chips - £2.00', 'Grand Total: £6.50'].join("\n") + "\n"
      expect{ finish_my_order.receipt }.to output(expected).to_stdout
    end
  end

  describe 'finishing order' do 
    it 'fails if nothing was ordered' do 
      my_order = Order.new
      expect{ FinishMyOrder.new(my_order) }.to raise_error('Order empty')
    end

    # twilio tests to come
  end
end