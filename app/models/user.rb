class User < ActiveRecord::Base
  include PgSearch
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :listings
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "70x70>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  multisearchable :against => [:name, :description]



  def self.cities
  	["Auckland", "Wellington", "Christchurch", "Dunedin"]
  end

end
