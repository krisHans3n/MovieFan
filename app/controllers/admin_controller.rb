class AdminController < ApplicationController
  before_action :admin_user?, only: [:index]
  before_action :not_admin? 


  
  def index
    @confirmed_orders = ConfirmedOrder.all 
    
  end
end
