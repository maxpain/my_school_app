class OrdersController < ApplicationController

  def index
    if current_user.try(:admin?)
      @orders = Order.all.order(id: :desc)
    else
      @orders = Order.where(user_id: current_user.try(:id)).order(id: :desc)   #send_
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def close
    @order = Order.find(params[:id])
    if @order.verificated? && @order.verificated? && @order.paid!
      session[:current_order] = nil
      flash[:notice] = 'Заказ выполняется'
    else
      flash[:alert] = @order.errors.full_messages.first || 'Заказ не подтвержден!'
    end
    redirect_to products_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    #current_order.line_items.delete_all
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order destroyed' }
      format.json { head :no_content }
    end
  end

  private

    def send_to_user_params
      params.require(:order).permit(:user_id, :total_price, :status)
    end
end