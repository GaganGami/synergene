class Inquiry < ActiveRecord::Base
	validates :email, :subject, presence: true
end
