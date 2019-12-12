class AdminController < ApplicationController
  before_action :admin_user?, only: [:index]
  before_action :not_admin? 


  
  def index
    @confirmed_orders = ConfirmedOrder.all 
    
    @liked_movies_hash = Movie.joins(:movieswatcheds).limit(20).group("movies.id").order("count(movie_id) desc").count("movieswatcheds.movie_id")

@movies_title = []
@likes = []

    @liked_movies_hash.each do |id, likes|

      mov = Movie.select(:Title).find_by(id: id)
      @movies_title << mov.Title
      @likes << likes 
    end
    @qtty = []
    @orderdate = [] 
    @con_order = ConfirmedOrder.order("date_trunc('day', updated_at) desc, id desc").pluck("date_trunc('day', updated_at)", :order_id)

    @con_order.each do |dates, orderid| 
      @orderdate << dates.strftime('%d-%m-%Y')
      ord = Order.select(:total_price).find_by(id: orderid)
      @qtty << ord.total_price.to_f

    end


  end
end
