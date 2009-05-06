class Library < ActiveRecord::Base

    has_many :library_versions, :order => 'created_at DESC'

    def latest
	self.library_versions.find :first
    end

end
