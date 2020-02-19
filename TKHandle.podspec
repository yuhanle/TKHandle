#
# Be sure to run `pod lib lint TKHandle.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKHandle'
  s.version          = '0.1.0'
  s.summary          = 'TKHandle for us.'

  s.description      = <<-DESC
Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yuhanle/TKHandle'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yuhanle' => 'thinker.wen@liulishuo.com' }
  s.source           = { :git => 'https://github.com/yuhanle/TKHandle.git', :tag => s.version.to_s }
  s.swift_version = '5.0'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TKHandle/Classes/**/*'
end
