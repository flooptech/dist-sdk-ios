Pod::Spec.new do |s|

  s.name     = 'floop'
  s.version  = '1.5'
  s.summary  = 'A COPPA-compliant sharing framework for kids apps.'
  s.author = { 'Floop' => 'support-dev@getfloop.com' }
  s.homepage = 'https://getfloop.com/'
  s.license = { :type => 'Commercial' }
  s.requires_arc = true

#   s.ios.deployment_target = '6.0'
  s.source = {
    :git => 'https://github.com/flooptech/floopsdk-ios-pub',
    :tag => s.version.to_s
  }

  s.frameworks =  'AdSupport', 'CFNetwork', 'CoreData', 'CoreImage', 'MobileCoreServices', 'SystemConfiguration', 'QuartzCore', 'Security'
  
  s.ios.vendored_frameworks = 'floopsdk.embeddedframework/floopsdk.framework'
  s.resources = 'floopsdk.embeddedframework/floopsdk.bundle'

end