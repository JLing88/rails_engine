class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(number = 5)
    Merchant.select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) as revenue_sum")
            .joins(invoices: [:invoice_items, :transactions])
            .group(:id).order("revenue_sum")
            .where("transactions.result = ?", "success")
            .order(revenue_sum: :desc)
            .limit(number)
  end
end
