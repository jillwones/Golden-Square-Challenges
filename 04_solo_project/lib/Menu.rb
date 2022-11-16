class Menu 
  attr_reader :menu
  def initialize(terminal)
    @menu = [
      { name: 'burger', price: 4.50, quantity: 10 },
      { name: 'hot dog', price: 3.00, quantity: 10 },
      { name: 'CocaCola', price: 1.00, quantity: 5 },
      { name: 'chips', price: 2.00, quantity: 1 }
    ]
    @terminal = terminal
  end

  def list_available
    @terminal.puts 'Items in stock:'
    item_num = 1
    available_items.each do |item|
      name = item[:name]
      price = item[:price]
      @terminal.puts "#{item_num}. #{name} - £#{format_price(price)}"
      item_num += 1
    end
  end

  private 

  def available_items
    @menu.select { |item| item[:quantity] > 0 }
  end

  def format_price(price)
    sprintf "%.2f", price
  end
end