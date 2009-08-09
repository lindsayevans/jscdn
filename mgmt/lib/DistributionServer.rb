class DistributionServer < ActiveRecord::Base

    def online?
	online
    end

    def status
	{:text => 'online', :class => 'online'}
    end

end
