class GeolocationsController < ApplicationController
  def update
    @user = current_user
   #@user.update_attributes(permitted_params)
   #(currentlatitude: :latitude, currentlongitude: :longitude)
    @user.update(permitted_params)# = permitted_params.latitude
@user.save



   # current_user.currentlongitude.update(permitted_params)
  end

  private

  def permitted_params
    params.permit(:currentlatitude, :currentlongitude)
  end
end