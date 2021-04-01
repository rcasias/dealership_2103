
class Dealership
  attr_reader :name,
              :address,
              :inventory,
              :inventory_count
  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.length
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    inventory_count >= 1
  end

  def cars_by_make(make)
    @inventory.find_all do |car|
      car.make == make
    end
  end

  def total_value
    @inventory.sum do |car|
      car.total_cost
    end
  end

  def details
    {
      "total_value" => total_value,
      "address" => @address
    }
  end

  def average_price_of_car
    (total_value / @inventory_count).to_s
  end

  def cars_by_price
    @inventory.map do |cars|
      cars.total_cost
    end.sort
    # require'pry';binding.pry
  end

  def cars_sorted_by_price
    array = []
    cars_by_price.each do |price|
      @inventory.each do |car|
        if price == car.total_cost
          array << car
        end
      end
    end
    array
  end

  def inventory_hash
    @inventory.group_by do |car|
      car.make
    end
  end
end
