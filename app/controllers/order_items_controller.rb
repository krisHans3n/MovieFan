class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    #@order_item = OrderItem.new(order_item_params)
    @order = current_order 
    @item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id 
    redirect_to merchandises_path

  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order = current_order
        @order_item = @order.order_item.find(params[:id])
        @order_item.update(order_item_params)
        @order_items = @order.order_items
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order = current_order
        @item = @order.order_items.find(params[:id])
        @item.destroy
        @order.save 
        redirect_to cart_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:quantity, :merchandise_id)
    end
end
