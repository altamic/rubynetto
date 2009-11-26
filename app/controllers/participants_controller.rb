class ParticipantsController < ApplicationController
  skip_before_filter :authenticate
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
      flash[:notice] = "Iscritto creato correttamente."
      redirect_to @participant
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @participant.update_attributes(params[:participant])
      flash[:notice] = "Iscritto aggiornato correttamente."
      redirect_to @participant
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @participant.destroy
    flash[:notice] = "Iscritto eliminato correttamente."
    redirect_to participants_url
  end
  
  private
  def find_participant
    @participant = Participant.find(params[:id])
  end
end
