class Admin::RestaurantsController < Admin::BaseController


def index
  @restaurants = Restaurant.page(params[:page]).per(9)
end

def new
  @restaurant = Restaurant.new

end

def create
  @restaurant = Restaurant.new(restaurant_params)
  if @restaurant.save
    flash[:notice] = "restaurant was successfully created"
    redirect_to admin_restaurants_path
  else
    flash.now[:alert] = "restaurant was failed to create"
    render :new
  end
end


before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

def show

end

def edit

end

def update
  if @restaurant.update(restaurant_params)
    flash[:notice] = "restaurant was successfully updated"
    redirect_to admin_restaurant_path(@restaurant)
  else
    flash.now[:alert] = "restaurant was failed to update"
    render :edit
  end

end

def destroy
  @restaurant.destroy
  redirect_to admin_restaurants_path
  flash[:alert]= "restaurant was deleted"

end

private

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end
def restaurant_params
  params.require(:restaurant).permit(:name, :tel, :adress, :opening_hours, :description, :image, :category_id)
end

end
