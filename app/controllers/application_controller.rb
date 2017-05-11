class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #def after_sign_in_path_for(resource)
  #  persons_profile_path
  #end

  #def after_sign_out_path_for(resource_or_scope)
  #  welcome_index_path
  #end

  prepend_before_action :check_current_order

  helper_method :current_order

  def access_denied(exception)
    redirect_to '/', alert: exception.message
  end

  def index
    @pupils = Pupil.where.not(currentlongitude: nil)
    @hash = Gmaps4rails.build_markers(@pupils) do |pupil, marker|
        marker.lat pupil.currentlatitude
        marker.lng pupil.currentlongitude
        marker.infowindow pupil.fio
      end
  end

  private

    def check_current_order

      if session[:current_order]
        @order ||= ::Order.find(session[:current_order])
      else
  #          if user_signed_in?
   #   if current_user.admin?
        @order = ::Order.create(user_id: current_user.try(:id))
        session[:current_order] = @order.id
      end
  #  end
#  end
    end

    def current_order
      Order.find(session[:current_order]) if session[:current_order]
    end

end
