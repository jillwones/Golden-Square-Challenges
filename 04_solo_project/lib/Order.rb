class Order
  attr_reader :order

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add(item)
    raise 'Item not on the menu' unless menu_includes_item(item)
    raise 'Item not in stock' if item_out_of_stock(item)

    @order << [item, price_of_item(item)]
    stock_of_item_decreases(item)
  end

  private

  def menu_includes_item(item)
    @menu.menu.each do |menu_item|
      return true if menu_item[:name] == item
    end
    false
  end

  def item_out_of_stock(item)
    @menu.menu.each do |menu_item|
      return true if menu_item[:quantity] < 1 and menu_item[:name] == item
    end
    false
  end

  def price_of_item(item)
    @menu.menu.each do |menu_item|
      return menu_item[:price] if menu_item[:name] == item
    end
  end

  def stock_of_item_decreases(item)
    @menu.menu.each do |menu_item|
      menu_item[:quantity] -= 1 if menu_item[:name] == item
    end
  end
end
