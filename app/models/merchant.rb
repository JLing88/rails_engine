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

  def self.revenue_by_date(date)
    Invoice.select("sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
      .joins(:invoice_items, :transactions)
      .where(invoices: {updated_at: date.to_date.all_day})
      .where("transactions.result = ?", "success")
  end

  def self.revenue(merchant_id)
    find(merchant_id).invoices
      .joins(:invoice_items, :transactions)
      .where("transactions.result = ?", "success")
      .sum("invoice_items.quantity * invoice_items.unit_price) as revenue")
  end

end
