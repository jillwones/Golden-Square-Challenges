require_relative './FinishMyOrder'
require_relative './Menu'
require_relative './Order'
require_relative './Text'

burger_restaurant = Menu.new
burger_restaurant.list_available # shows menu items that are in stock
my_order = Order.new(burger_restaurant)
my_order.add('burger')
my_order.add('burger')
my_order.add('CocaCola')
my_order.add('chips')
finish_my_order = FinishMyOrder.new(my_order)
finish_my_order.receipt # puts an itemised receipt with grand total in the terminal
finish_my_order.send_text # sends a text to the default number (mine) with a confirmation, if I ordered at 7:05pm the text will say '"Thank you! Your order was placed and will be delivered before 7:25 PM'

# TODOs from coach alex:

# google => mock twilio gem!!!
# configure rubocop so rspec isnt ugly anymore
# pass menu in initialize in order => made the change
# make more modular, so have a method in menu that decreases the stock count, order shouldnt fiddle with the menu instance
