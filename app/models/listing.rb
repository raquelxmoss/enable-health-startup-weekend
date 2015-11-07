class Listing < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  before_create :normalize_title
	scope :open, -> { where(status: 'open') }
	scope :active, -> { where("expiration_date > ?", DateTime.now) }

private

  def normalize_title
  	self.title = self.title.titleize
  end

end
