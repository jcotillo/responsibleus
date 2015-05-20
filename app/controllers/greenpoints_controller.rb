class GreenpointsController < ApplicationController
  def new
  	@points = Greenpoint.new
  end

  def create
  	@points = Greenpoint.new greenpoints_params
    @points.business_id = current_user.business_id 
    @points.save
    render :json => @event
  end

  def edit
  end

  def update
  end

  def greenpoints_params
  	params.require(:business).permit(:electricity, :recycling, :transportation, :total)
  end
end
