require_relative './FinishMyOrder.rb'
require_relative './Menu.rb'
require_relative './Order.rb'
require_relative './Text.rb'


burger_restaurant = Menu.new
burger_restaurant.list_available # shows menu items available
my_order = Order.new
my_order.add('burger', burger_restaurant)
my_order.add('chips', burger_restaurant)
finish_my_order = FinishMyOrder.new(my_order)
finish_my_order.receipt # puts an itemised receipt with grand total in the terminal
finish_my_order.send_text # sends a text to the default number (mine) with a confirmation, if I ordered at 7:05pm the text will say '"Thank you! Your order was placed and will be delivered before 7:25 PM'