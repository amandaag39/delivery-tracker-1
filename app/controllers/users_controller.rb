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

  def create
    the_delivery = Delivery.new
    the_delivery.description = params.fetch("query_description")
    the_delivery.details = params.fetch("query_details")
    the_delivery.supposed_to_arrive_on = params.fetch("query_supposed_to_arrive_on")
    the_delivery.user_id = params.fetch("query_user_id")
    the_delivery.arrived = params.fetch("query_arrived", false)

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { :notice => "Delivery created successfully." })
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end
  
end
