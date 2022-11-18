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
my_order.add('burger', 6)
my_order.add('CocaCola', 2)
my_order.add('chips', 1)
my_order.complete_order

# Calling complete_order on my_order will create a FinishMyOrder instance and pass in my_order in the initialize, then it calls #receipt on that FinishMyOrder instance as well as send_text
# Here is the receipt you would see:
=begin 
What you ordered:
6x burger - £27.00
2x CocaCola - £2.00
1x chips - £2.00
Grand Total: £31.00
=end
# sends a text to the default number (mine) with a confirmation, if I ordered at 7:05pm the text will say '"Thank you! Your order was placed and will be delivered before 7:25 PM'

# TODOs:

# add number of items as an argument to add method in Order => done
# google => mock twilio gem!!!
# configure rubocop so rspec isnt ugly anymore
# pass menu in initialize in order => done
# make more modular, so have a method in menu that decreases the stock count, order shouldnt fiddle with the menu instance => done
