class OrdersController < ApplicationController

  def index
    if current_user.try(:admin?)
      @orders = Order.all
    else
      @orders = Order.where(user_id: current_user.try(:id))   #send_
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  #def user_complete
  #  @order = Order.find(params[:id])
  #  if @order.complete!
  #    flash[:notice] = 'Подтверждено'
  #  else
  #    flash[:alert] = 'Не удалось подтвердить'
  #  end
  #  redirect_to orders_path
  #end

  def close
    @order = Order.find(params[:id])
    if @order.verificated? && @order.verificated? && @order.paid!#(send_to_user_params)
      session[:current_order] = nil
      flash[:notice] = 'Заказ выполняется'
    else
      flash[:alert] = 'Заказ не подтвержден!'
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
