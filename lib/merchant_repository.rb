require './lib/merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(csv)
    @merchants ||= load_data(csv)
  end

  def load_data(merchants)
    csv = CSV.open(merchants, headers: true, header_converters: :symbol)
    csv.map do |row|
      Merchant.new({
          id:           row[:id],
          name:         row[:name],
          created_at:   row[:created_at],
          updated_at:   row[:updated_at]
        })
    end
  end

  def all
    merchants
  end
end
