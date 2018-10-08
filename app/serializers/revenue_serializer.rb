class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    '%.2f' % object
  end  
end
