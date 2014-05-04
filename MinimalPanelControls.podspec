#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "MinimalPanelControls"
  s.version          = "0.1.1"
  s.summary          = "A set of controls with a minimal design style. Suitable for use on UI's that require a control panel type of interface."
  s.homepage         = "https://github.com/urtubia/MinimalPanelControls"
  #s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.screenshots      = "https://raw.githubusercontent.com/urtubia/MinimalPanelControls/master/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Hector Urtubia" => "hector@bigrobotstudios.com" }
  s.source           = { :git => "https://github.com/urtubia/MinimalPanelControls.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/bigrobotstudios'

  s.platform     = :ios, '6.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  #s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
