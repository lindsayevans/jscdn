class LibraryCollection < ActiveRecord::Base

    has_many :library_versions, :order => 'created_at DESC'

end

