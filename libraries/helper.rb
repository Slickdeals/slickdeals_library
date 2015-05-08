#
# Cookbook Name:: slickdeals_library
# Library:: helpers
#
# Copyright (C) 2014 Slickdeals, Inc. All Rights Reserved
#

module Slickdeals
  # Generic helpers that don't fit bigger schemes
  module Helper
    include Chef::Mixin::Language if Chef::VERSION < '11.0.0'
    include Chef::DSL::PlatformIntrospection if Chef::VERSION >= '11.0.0'

    ##
    # A great uniformly distributed unique number
    # THIS ISN'T RANDOM! It's totally predictable but good for splaying out load
    def unique_number(splay_max)
      checksum = Digest::MD5.hexdigest(node['fqdn'] || node['machinename'])
      checksum.to_s.hex % splay_max.to_i
    end
  end
end
