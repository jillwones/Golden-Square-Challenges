class Order
  attr_reader :order

  def initialize
    @order = []
  end

  def add(item, menu)
    raise 'Item not on the menu' unless menu_includes_item(item, menu)
    raise 'Item not in stock' if item_out_of_stock(item, menu)

    @order << [item, price_of_item(item, menu)]
    stock_of_item_decreases(item, menu)
  end

  private

  def menu_includes_item(item, menu)
    menu.menu.each do |menu_item|
      return true if menu_item[:name] == item
    end
    false
  end

  def item_out_of_stock(_item, menu)
    menu.menu.each do |menu_item|
      return true if menu_item[:quantity] < 1
    end
    false
  end

  def price_of_item(item, menu)
    menu.menu.each do |menu_item|
      return menu_item[:price] if menu_item[:name] == item
    end
  end

  def stock_of_item_decreases(item, menu)
    menu.menu.each do |menu_item|
      menu_item[:quantity] -= 1 if menu_item[:name] == item
    end
  end
end
