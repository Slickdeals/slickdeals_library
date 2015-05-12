# Slickdeals_Library

This is a Library cookbook! There are no recipes and it does not belong in a runlist

## Requirements
Tested on CentOS 6 and Ubuntu 14.04

## Helpers
### Slickdeals::IPHelper
All of these functions use OHAI to get information.
#### find_bound_ips(scope)
Takes a scope like '172.16.0.0/12' and returns all ip's on the box that are within the scope

#### all_private_bound_ips
Returns all ip's on the box other than 127.0.0.1 that are within the official PRIVATE ip ranges
10/8, 172.16/12 and 192.168/16

#### all_bound_ips
Returns all valid IPs that are seen by OHAI on the box

#### find_bind_ip(scope)
_LEGACY FUNCTION, do not use unless needed_

Returns the __First__ IP on the box that is within the specified scope. __FIRST__ is defined by the first match in OHAI


### Slickdeals::Helper
#### unique_number(max)
returns a uniformly distributed unique number between 0 and max. This is based on the hostname of the machine so changing the name will change the results. Otherwise the number should remain the same through all chef runs.

## Usage
Require this cookbook in your wrapper's `metadata.rb`.
In any reciple needed include the helper(s) needed with the following

```ruby
Chef::Recipe.send(:include, Slickdeals::HelperName)
```

If you need to use this in a resource you would use;

```ruby
Chef::Resource.ResourceName.send(:include, Slickdeals::HelperName)
```

## Development
Rake is set up to run all the tests! Make sure to add chefspec and serverspec as needed.

Also see https://www.chef.io/blog/2014/03/12/writing-libraries-in-chef-cookbooks/

## License & Authors
- Authors:
 - David Aronsohn <hipster@slickdeals.net>

```text
Copyright (c) 2015 Slickdeals, LLC
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
