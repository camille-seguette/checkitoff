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
    @user = current_user
    @item = @user.items.find(params[:user_id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash[:alert] = "Item could not be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

private
  def items_params
    params.require(:item).permit(:name)
  end

end
