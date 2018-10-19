#
# Be sure to run `pod lib lint iComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iComponent'
  s.version          = '0.1.0'
  s.summary          = 'This repository is created for the revamp purpose of iComponent framework. Where we categorised all frameworks individually.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This repository is created for the revamp purpose of iComponent framework. Where we categorised all frameworks individually.'

  s.homepage         = 'https://github.com/MradulM/iComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MradulM' => 'mradul.mathur@ranosys.com' }
  s.source           = { :git => 'https://github.com/MradulM/iComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'iComponent/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iComponent' => ['iComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
