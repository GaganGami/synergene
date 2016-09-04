class Testimonial < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "167x167>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
