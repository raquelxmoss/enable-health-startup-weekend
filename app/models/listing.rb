class Listing < ActiveRecord::Base
  belongs_to :user

  # before_action :normalize_title

  # def normalize_title
  # 	title.titelize
  # end
end
