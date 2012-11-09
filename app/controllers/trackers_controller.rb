class TrackersController < ApplicationController
  def index

  end

  def show
    @documents = ExTracker
  end

  def new
    @ex_tracker = ExTracker.new
  end

  def create
    doc = ExTracker.new({name: params[:name]})
    if doc.save
      notice = 'gespeichert'
    else
      notice = 'nicht gespeichert'
    end

    redirect_to tracker_path, notice: notice
  end
end
