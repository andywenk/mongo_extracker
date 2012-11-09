class TrackersController < ApplicationController
  def index

  end

  def show
    @documents = ExTracker.only(:name)
    @categories = {}
    @documents.each do | document |
      doc = document.name.strip
      if @categories.include?(doc)
        @categories[doc] += 1
        next
      end
      @categories[doc] = 1
    end
  end

  def category
    @documents = ExTracker.where(name: params[:id])
  end

  def new
    @ex_tracker = ExTracker.new
  end

  def create
    doc = ExTracker.new({
      name: params[:name].strip,
      occurence: params[:occurence].strip,
      mesage: params[:message].strip,
      created_at: params[:created_at].strip
    })

    if doc.save
      notice = 'gespeichert'
    else
      notice = 'nicht gespeichert'
    end

    redirect_to tracker_path, notice: notice
  end
end
