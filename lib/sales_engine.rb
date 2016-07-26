require "./lib/merchant_repository"
require "./lib/item_repository"
require 'pry'
require 'csv'

class SalesEngine
  def self.from_csv(csv)
    @items = ItemRepository.new(csv[:items])
    @merchants = MerchantRepository.new(csv[:merchants])
    self
  end

  def self.merchants
    @merchants
  end

  def self.items
    @items
  end
end

se = SalesEngine.from_csv({items: "./data/items.csv", merchants: "./data/merchants.csv"})
