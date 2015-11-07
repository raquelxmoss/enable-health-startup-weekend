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
    if @listing.update(listing_params)
      redirect_to listing_path @listing
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
      redirect_to :back
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path @listing
    else
      flash[:error] = @listing.errors.full_messages.join("\n")
      redirect_to :back
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

private

  def load_listing
    @listing = Listing.find params.require(:id)
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :user, :expiration_date, :status, :urgency, :location)
  end

end
