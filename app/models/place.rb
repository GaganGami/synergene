class Place < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "", :path => "/places/:id_partition/:style/:filename" #/images/:style/missing.png
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


end
