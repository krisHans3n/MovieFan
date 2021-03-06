class Order < ApplicationRecord
  has_many :order_items
  before_save :update_total 
  before_create :update_status
  has_one :confirmed_order

  def calculate_total 
    self.order_items.collect {|i| i.merchandise.price * i.quantity}.sum 
  end

  private 

  def update_status 
    if self.status == nil? 
      self.status = "In Progress"
    end
  end

  def update_total 
    self.total_price = calculate_total
  end


end
