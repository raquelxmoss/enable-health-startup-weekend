class Listing < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  before_create :normalize_title

  def normalize_title
  	self.title = self.title.titleize
  end

end
