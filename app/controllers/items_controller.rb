class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(items_params)

    if @item.save
      flash[:notice] = "Item was saved successfully."
      redirect_to @user
    else
      flash.now[:alert] = "Error creating item. Please try again."
      redirect_to @user
    end
  end

  def destroy
  end

private
  def items_params
    params.require(:item).permit(:name)
  end

end
