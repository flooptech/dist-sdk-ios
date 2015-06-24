Pod::Spec.new do |s|

  s.name     = 'Floop-iOS'
  s.version  = '2.2.1'
  s.summary  = 'COPPA-compliant services for apps and games that kids play.'
  s.author = { 'Floop' => 'support-dev@getfloop.com' }
  s.homepage = 'http://getfloop.com/'
  s.license = { :type => 'Commercial', :file => 'license.txt' }
  s.requires_arc = true
  s.ios.deployment_target = '6.0'

  s.source = {
    :git => 'https://github.com/flooptech/dist-sdk-ios.git',
    :tag => s.version.to_s
  }

  s.frameworks =  'Accelerate', 'AdSupport', 'CFNetwork', 'CoreData', 'CoreImage', 'MobileCoreServices', 'SystemConfiguration', 'QuartzCore', 'Social', 'MessageUI', 'AddressBook', 'AddressBookUI'
  s.ios.vendored_frameworks = 'floopsdk.embeddedframework/floopsdk.framework'
  s.resources = 'floopsdk.embeddedframework/floopsdk.bundle'

end
