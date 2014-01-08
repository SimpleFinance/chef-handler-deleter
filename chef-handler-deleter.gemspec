Gem::Specification.new do |s|
  s.name = 'chef-handler-deleter'
  s.version = '0.1.0'
  s.author = 'Simple Finance'
  s.email = 'ops@simple.com'
  s.homepage = 'http://github.com/SimpleFinance/chef-handler-deleter'
  s.summary = 'Just deletes some stuff after notifications'
  s.description = 'Deletes <args> after notifications run.'
  s.files = ::Dir.glob('**/*')
  s.require_paths = ['lib']
end

