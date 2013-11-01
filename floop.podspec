# Pod::Spec.new do |s|
#   s.name     = 'Floop'
#   s.version  = '1.5'
#   s.summary  = 'A COPPA-compliant sharing framework for kids apps.'
#   s.author = { 'Floop' => 'devsupport@getfloop.com' }
#   s.homepage = 'https://getfloop.com/'
#   s.license = { :type => 'Commercial' }
#   s.source   = { :git => 'https://github.com/AFNetworking/AFNetworking.git', :tag => '2.0.1', :submodules => true }
#   s.requires_arc = true

#   s.ios.deployment_target = '6.0'
  s.source = {
    :git => 'https://github.com/sincerely/shiplib-ios-framework.git',
    :tag => s.version.to_s
  }

  s.frameworks =  'AdSupport', 'CFNetwork', 'CoreData', 'CoreImage', 'MobileCoreServices', 'SystemConfiguration', 'QuartzCore', 'Security'
  s.ios.vendored_frameworks = 'floopsdk.framework'
  s.resources = 'floopsdk.bundle'
