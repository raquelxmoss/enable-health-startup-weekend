class ListingsController < ApplicationController
  before_filter :load_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @listing = Listing.new
  end

  def create
  end

  def destroy
    @listing.destroy
    redirect_to :index
  end

private

  def load_listing
    @listing = Listing.find params.require(:id)
  end

end
