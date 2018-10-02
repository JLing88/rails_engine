class Transaction < ApplicationRecord
  validates_presence_of :result

  belongs_to :invoice
end
