class Service < ActiveRecord::Base

	def short_description
		self.description
	end
end
