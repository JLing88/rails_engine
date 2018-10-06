class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_merchant(id)
    Merchant.select("merchants.*, count(merchants.id) AS count")
            .joins(:transactions, :invoices)
            .where("invoices.customer_id = ?", id)
            .where("transactions.result = ?", "success")
            .group("merchants.id")
            .order(count: :desc)
            .limit(1)
  end
end
