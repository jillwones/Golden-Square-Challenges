class FinishMyOrder
  def initialize(order, terminal = Kernel)
    @order = order
    @order_array = order.order
    @terminal = terminal

    raise 'Order empty' if @order_array.empty?
  end

  def receipt
    @terminal.puts 'What you ordered:'
    @order_array.each do |name, price, num_of_items|
      @terminal.puts "#{num_of_items}x #{name} - #{format_price(price)}"
    end
    @terminal.puts "Grand Total: #{format_price(total)}"
  end

  def send_text(number = '+447379766090')
    @text = Text.new
    @text.send_text(number)
  end

  private

  def format_price(price)
    "£#{format '%.2f', price}"
  end

  def total
    @order_array.sum { |_name, price| price }
  end
end
