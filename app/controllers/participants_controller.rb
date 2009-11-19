class ParticipantsController < ApplicationController
  before_filter :find_participant, :only => %w(show edit update destroy)
  
  def index
    @participants = Participant.all
  end
  
  def show
  end
  
  def new
    @participant = Participant.new
  end
  
  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      flash[:notice] = "Successfully created participant."
      redirect_to @participant
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @participant.update_attributes(params[:participant])
      flash[:notice] = "Successfully updated participant."
      redirect_to @participant
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @participant.destroy
    flash[:notice] = "Successfully destroyed participant."
    redirect_to participants_url
  end
  
  protected
  def find_participant
    @event = Participant.find(params[:id])
  end

end
