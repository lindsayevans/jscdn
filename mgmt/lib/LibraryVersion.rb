class LibraryVersion < ActiveRecord::Base

    def version
	'?.?.?' if major_version.nil?
	[major_version,minor_version,incremental_version].join '.'
    end

end

