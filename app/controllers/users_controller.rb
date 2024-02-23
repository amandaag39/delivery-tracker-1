class UsersController < ApplicationController
  def index
    if current_user != nil
      @list_of_waiting_deliveries = Delivery.where(user_id:current_user.id, arrived:"false")
      @list_of_arrived_deliveries = Delivery.where(user_id:current_user.id, arrived:"true")
      render "users/index"
    else
      redirect_to("/users/sign_in", {alert:"Please sign in to see content"})
    end 
  end
end
