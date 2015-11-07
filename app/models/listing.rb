class Listing < ActiveRecord::Base
  belongs_to :user

  before_create :normalize_title

  def normalize_title
  	self.title = self.title.titleize
  end
end
