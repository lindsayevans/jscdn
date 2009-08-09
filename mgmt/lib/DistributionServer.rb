require 'net/http'

class DistributionServer < ActiveRecord::Base

    def online?
	online
    end

    def status

	fail = {:text => 'offline', :class => 'offline'}
	win = {:text => 'online', :class => 'online'}

	begin
	    response = Net::HTTP.get_response domain_name, "/nginx_status.json"
	    if !response.is_a?(Net::HTTPSuccess) || !online?
		fail
	    else
		win
	    end
	rescue
	    fail
	end

    end

end
