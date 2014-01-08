# Deleter handler
Deletes the arguments from the filesystem that you pass in, after notifications
have run. Useful because of the lack of run phases in Chef.

Keep in mind this uses recursive deletion. Additionally, FileUtils#rf\_rf does
not obey `*`, so you will have to use Dir#glob beforehand.

## Usage
Either just pull the handler file into a files directory of one of your
cookbooks, or download as a Rubygem and source it that way.

```ruby
# Option 1
cookbook_file "#{node[:chef_handler][:handler_path]}/chef-handler-deleter.rb" do
  source 'chef-handler-deleter.rb'
  mode 00600
end

chef_handler 'Deleter' do
  source "#{node[:chef_handler][:handler_path]}/chef-handler-deleter.rb"
  action :enable
end

# Option 2
chef_gem 'chef-handler-deleter' do
  action :install
end

chef_handler 'Deleter' do
  source ::File.join(Gem::Specification
                       .find_by_name('chef-handler-deleter')
                       .lib_dirs_glob,
                       'chef-handler-deleter.rb')
  action :enable
end
```

## Arguments
`paths` - Array of locations on the filesystem to delete.

## Questions?
Hop on `##simple` on Freenode with any questions or concerns.

## Author/License
Simple Finance \<ops@simple.com\>
Apache License, Version 2.0
