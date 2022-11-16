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
finish_my_order.receipt # should puts an itemised receipt with grand total
finish_my_order.send_text