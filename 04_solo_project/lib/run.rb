require_relative './FinishMyOrder'
require_relative './Menu'
require_relative './Order'
require_relative './Text'

burger_restaurant = Menu.new
burger_restaurant.list_available 
=begin
Items in stock:
1. burger - £4.50
2. hot dog - £3.00
3. CocaCola - £1.00
4. chips - £2.00
=end
my_order = Order.new(burger_restaurant)
my_order.add('burger', 4)
my_order.add('burger', 1)
my_order.add('CocaCola', 3)
my_order.add('chips', 1)
finish_my_order = FinishMyOrder.new(my_order)
finish_my_order.receipt 
=begin 
What you ordered:
4x burger - £18.00
1x burger - £4.50
3x CocaCola - £3.00
1x chips - £2.00
Grand Total: £27.50
=end
finish_my_order.send_text # sends a text to the default number (mine) with a confirmation, if I ordered at 7:05pm the text will say '"Thank you! Your order was placed and will be delivered before 7:25 PM'

# TODOs:

# add number of items as an argument to add method in Order => done
# google => mock twilio gem!!!
# configure rubocop so rspec isnt ugly anymore
# pass menu in initialize in order => done
# make more modular, so have a method in menu that decreases the stock count, order shouldnt fiddle with the menu instance => done
