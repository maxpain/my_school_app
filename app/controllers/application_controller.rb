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
    @coords = [{:latitude => 53.1881658,:longitude => 44.97538}, #верх прав
               {:latitude => 53.1841658,:longitude => 44.97538}, #ниж прав
               {:latitude => 53.1881658,:longitude => 44.96738}, #верх лев
               {:latitude => 53.1841658,:longitude => 44.96738}] #ниж лев
    @hash = Gmaps4rails.build_markers(@pupils) do |pupil, marker|
      marker.lat pupil.currentlatitude
      marker.lng pupil.currentlongitude
      marker.infowindow pupil.fio
      if pupil.currentlatitude <= 53.1881658 &&
         pupil.currentlatitude >= 53.1841658 &&
         pupil.currentlongitude <= 44.97538 &&
         pupil.currentlongitude >= 44.96738
      marker.picture({
                      :url => "http://maps.google.com/mapfiles/ms/icons/green-dot.png",
                      :width => 32,
                      :height => 32
                      })
      else
      marker.picture({
                      :url => "http://maps.google.com/mapfiles/ms/icons/red-dot.png",
                      :width => 32,
                      :height => 32
                      })

      end
    end

    @hash1 = Gmaps4rails.build_markers(@coords) do |coord, marker|
      marker.lat coord[:latitude]
      marker.lng coord[:longitude]
      marker.picture({
                      :url => "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                      :width => 32,
                      :height => 32
                      })
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
