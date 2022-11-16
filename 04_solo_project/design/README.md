# Solo Project Design Recipe

## 1. Describe the Problem
 
> As a customer  
> So that I can check if I want to order something  
> I would like to see a list of dishes with prices.
> 
> As a customer  
> So that I can order the meal I want  
> I would like to be able to select some number of several available dishes.
> 
> As a customer  
> So that I can verify that my order is correct  
> I would like to see an itemised receipt with a grand total.

Use the `twilio-ruby` gem to implement this next one. You will need to use
doubles too.

> As a customer  
> So that I am reassured that my order will be delivered on time  
> I would like to receive a text such as "Thank you! Your order was placed and
> will be delivered before 18:52" after I have ordered.


## 2. Design the Class System

```ruby
class Menu
  attr_reader :menu # testing terminal io here
  def initialize(terminal)
    # @menu will be an array of hashes, each hash will have the name of the item, the price and quantity
    # @terminal will be there so I can test what the method list puts to the terminal
  end 

  def list 
    # puts a the list of available menu items in a nice format
    # takes no args
    # will call on private method available_items that will return the @menu     
    # but only the items with a quantity > 0
  end

  private

  def available_items
    # will select the menu items with quantity > 0 and return that array
  end

  def format_price(price)
    # formats the price so its always like 5.00 or 3.50 rather than 5.0 or 3.5
  end
end

class Order # testing parent - child class here
  attr_reader :order
  def initialize
    # @order will be an empty array
  end

  def add(item, menu)
    # takes item and menu, item is a string and menu is an instance of the Menu class
    # will raise error if the item is not on the menu, it will call on a private method menu_includes_item(item, menu)
    # will raise error if item is out of stock, will call on a private method item_out_of_stock(item, menu)
    # if neither of these errors are raised then the item as well as its price is << onto the @order array
    # the price of the item is fetched from private method price_of_item(item, menu)
    # and then another private method is called, stock_of_item_decreases(item, menu)
    # returns nothing
  end
  
  private

  def menu_includes_item(item, menu)
    # takes item and menu, string and instance of Menu
    # will return true if the menu contains that item
    # will return false if the menu doesnt contain that item
  end

  def item_out_of_stock(item, menu)
    # takes item and menu, string and instance of Menu
    # will return true if the item is in stock
    # will return false if the item is out of stock
  end

  def price_of_item(item, menu)
    # takes item and menu, string and instance of Menu
    # will return the price of the item as a float
  end

  def stock_of_item_decreases(item, menu)
    # takes item and menu, string and instance of Menu
    # after adding an item to @order, this method will decrease the quantity of the that item in the menu instance
    # so if the quantity of chips is 2, when you add 2 to your order the quantity will then be 0
    # and if you tried to add a 3rd you'd get an error raised in the public add method that its out of stock
  end
end

class FinishMyOrder # peer class here
  def initialize(order, terminal)
    # @order = order
    # maybe have @order_array = order.order
    # @terminal = terminal
  end

  def print_receipt
    # prints itemised receipt with a grand total
    # will be looking at the @order_array instance variable
    # will puts the result, test with double of Kernel
  end 

  def send_text(number)
    # @text = Text.new(requester=Twilio::REST::Client)
    # @text.send_text(number)
  end
end

class Text # testing api requests here
  def initialize(requester)
    # @requester = requester 
  end 

  def send_text(number)
    # is called in the FinishMyOrder instance and talks to twilio api and sends text to say order will 
    # be with them in 20 minutes time from time order was placed
  end 
end

# roughly how to use

burger_restaurant = Menu.new
burger_restaurant.list # shows menu items available
my_order = Order.new
my_order.add('burger', burger_restaurant)
my_order.add('chips', burger_restaurant)
finish_my_order = FinishMyOrder.new(my_order)
finish_my_order.receipt # should puts an itemised receipt with grand total
finish_my_order.send_text(+441234512345) # should ultimately send a text to the user that their order will be ready in 20 minutes time

```
 
## 3. Create Examples as Integration Tests
 
```ruby

```
 
## 4. Create Examples as Unit Tests
 
```ruby


```
 
## 5. Implement the Behaviour
 
For each example you create as a test, implement the behaviour that allows the
class to behave according to your example.
 
Then return to step 3 until you have addressed the problem you were given. You
may also need to revise your design, for example if you realise you made a
mistake earlier.
