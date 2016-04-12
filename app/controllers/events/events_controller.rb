class Events::EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events/events
  # GET /events/events.json
  def index
    @events = Events::Event.all
  end

  # GET /events/events/1
  # GET /events/events/1.json
  def show
    section_name
    @page_name = "Details for #{@event.eventable_type.to_s.titleize.capitalize} '#{@event.title}'"
  end

  # GET /events/events/new
  def new
    @page_name = "New Event"
    section_name
    eventable_type = params[:eventable_type].present? ? params[:eventable_type] : ""
    @event = Events::Event.new(eventable_type: eventable_type)
  end

  # GET /events/events/1/edit
  def edit
  end

  # POST /events/events
  # POST /events/events.json
  def create
    @event = Events::Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/events/1
  # PATCH/PUT /events/events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_event_path(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/events/1
  # DELETE /events/events/1.json
  def destroy
    eventable_type = @event.eventable_type
    @event.destroy
    redirect_to_url = eventable_type.present? && eventable_type == "ProfessionalEvent" ? events_professional_events_index_path() : events_social_events_index_path()
    respond_to do |format|
      format.html { redirect_to redirect_to_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def section_name
    params[:eventable_type].present? ? params[:eventable_type].to_s.titleize.capitalize : "Events"
  end

  def sub_section
    action_name
  end

  def sub_section_display_name
    false
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Events::Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title,:description,:event_date,:event_time,:user_id,:eventable_type,:location)
  end
end
