# Requires Net::DNS
require 'rubygems'
require 'net/dns/resolver'

class DnsServer < ActiveRecord::Base

    def online?
	online
    end

    def status

	fail = {:text => 'offline', :class => 'offline'}
	win = {:text => 'online', :class => 'online'}
	
	begin
	    res = Net::DNS::Resolver.new
	    res.nameservers = ip_address
	    packet = res.send "jscdn.net"
	    if packet.nil? || !online?
		fail
	    else
		win
	    end
	rescue
	    fail
	end


    end

end

