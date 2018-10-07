class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.most_revenue(number = 5)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue_sum")
            .joins(invoices: [:invoice_items, :transactions])
            .group(:id)
            .order("revenue_sum desc")
            .where("transactions.result = ?", "success")
            .limit(number)
  end

  def self.most_items(number = 5)
    select("merchants.*, sum(invoice_items.quantity) as items_count")
            .joins(invoices: [:invoice_items, :transactions])
            .group(:id)
            .order("items_count desc")
            .where("transactions.result = ?", "success")
            .limit(number)
  end
end
