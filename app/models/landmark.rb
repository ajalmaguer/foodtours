class Landmark < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tours

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
