# lib/chef-handler-deleter.rb
#
# Author: Simple Finance <ops@simple.com>
# Copyright 2013 Simple Finance Technology Corporation.
# Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Chef handler to delete locations on the filesystem post-run

require 'rubygems'
require 'chef'
require 'chef/handler'

class Deleter < Chef::Handler
  attr_reader :paths

  def initialize(options = defaults)
    @paths = options[:paths]
  end

  def defaults
    return {
      paths: []
    }
  end

  def report
    if run_status.success?
      Chef::Log.info 'Deleting paths specified for Deleter handler!'
      @paths.each do |path|
        Chef::Log.debug("Deleting #{path} ...")
        FileUtils.rm_rf(path)
      end
    end
  end
end
