class TalksController < ApplicationController
  before_filter :authenticate, :except => %w(index show)
  before_filter :find_event
  before_filter :find_talk, :only => %w(edit update destroy)

  def index
    @talks = @event.talks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
      format.json  { render :json => @talks }
    end
  end

  def new
    @talk = @event.talks.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  def edit
  end

  def create
    @talk = @event.talks.new(params[:talk])

    respond_to do |format|
      if @talk.save
        flash[:notice] = 'Lezione creata correttamente'
        format.html { redirect_to(event_talks_path(@event)) }
        format.xml  { render :xml => @talk, :status => :created, :location => @talk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        flash[:notice] = 'Lezione aggiornata correttamente'
        format.html { redirect_to(event_talks_path(@event)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to(event_talks_path(@event)) }
      format.xml  { head :ok }
    end
  end

  protected
  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_talk
    @talk = @event.talks.find(params[:id])
  end
end
