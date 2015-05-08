#
# Cookbook Name:: slickdeals_library
# Library:: helpers
#
# Copyright (C) 2014 Slickdeals, Inc. All Rights Reserved
#

module Slickdeals
  # IP address specific helper
  module IPHelper
    include Chef::Mixin::Language if Chef::VERSION < '11.0.0'
    include Chef::DSL::PlatformIntrospection if Chef::VERSION >= '11.0.0'
    require 'ipaddr'

    ##
    # Return all bound IPs on a node that are within a scope
    #   Returns: Array of Strings (Array empty if no matches)
    def find_bound_ips(scope)
      ip_range = IPAddr.new(scope)
      all_bound_ips.select { |ip| ip_range.include?(IPAddr.new(ip)) }
    end

    ##
    # All private addresses (not 127)
    #   Returns: Array of Strings (Array empty if no matches)
    def all_private_bound_ips
      find_bound_ips('10.0.0.0/8') + find_bound_ips('172.16.0.0/12') + find_bound_ips('192.168.0.0/16')
    end

    ##
    # All bound IPs ohai can see
    #   Returns: Array of Strings (Array empty if no matches)
    def all_bound_ips
      ip_list = []
      node['network']['interfaces'].each do |_ifce, attrs|
        next unless attrs['addresses'] # Not all interfaces have IPs
        ip_list.concat(attrs['addresses'].map { |addr, _| addr })
      end
      ip_list
    end

    ##
    # Legacy function that returns only the FIRST IP in scope
    #  Returns: String or nil
    def find_bind_ip(scope)
      ip_range = IPAddr.new(scope)
      all_bound_ips.each do |ip|
        return ip if ip_range.include?(IPAddr.new(ip))
      end
      nil
    end
  end
end
