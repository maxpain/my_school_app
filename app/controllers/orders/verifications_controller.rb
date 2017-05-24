class Orders::VerificationsController < ApplicationController
  before_action :find_order
  respond_to :js

  def create
    @order.send_verification if @order.update(permit_params)
  end

  def update
    @response = @order.verify!(params[:verification_code])
  end

  private

  def permit_params
    params.require(:order).permit(:customer_id)
  end

  def find_order
    @order = Order.find(params[:order_id])
  end
end