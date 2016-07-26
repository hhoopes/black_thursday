require "./lib/item"

class ItemRepository
  attr_reader :items

  def initialize(csv)
    @items ||= load_data(csv)
  end

  def load_data(items)
    csv = CSV.open(items, headers: true, header_converters: :symbol)
    csv.map do |row|
      Item.new({
          id:           row[:id],
          name:         row[:name],
          description:  row[:description],
          unit_price:   row[:unit_price],
          merchant_id:  row[:merchant_id],
          created_at:   row[:created_at],
          updated_at:   row[:updated_at]
          })
    end
  end

  def all
    items
  end
end
