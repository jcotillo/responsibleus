class EventsController < ApplicationController

  def eventships
    event = Event.find(params[:id])
    real = event.eventships.new(transportationschoice: params[:transportationschoice])
    real.business_id = event.business.id
    real.user_id = current_user.id
    real.save
    render :json => real
  end

  def index
  @events = Event.where(user_id: current_user.id)
  render :json => @events
  end

  def publicevents
    if current_user.business
  @pevents = Event.where(private: false).where.not(business_id: current_user.business.id)
  else 
  @pevents = Event.where(private: false)
  end
  render :json => @pevents
  end

  def new
  @event = Event.new
  # respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render :json => @event }
  #   end
  end

  def create
    @event = current_user.events.new event_params
    @event.private = true unless params[:event][:private]
    @event.business_id = current_user.business_id if current_user.business
    @event.save!
    render :json => @event
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  private

  def event_params
    params.require(:event).permit(:title, :description, :start, :end, :transportationschoice, :private)
  end

end
