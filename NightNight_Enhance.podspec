Pod::Spec.new do |s|
  s.name             = 'NightNight_Enhance'
  s.version          = '1.0.0'
  s.summary          = 'NightNight is a solution for integrating night mode which was written in swift.'

  s.description      = <<-DESC
NightNight is a framework to integrate night mode to application written in swift. NightNight provide MixedColor and MixedImage to fundamental UIKit and CoreAnimation layer. Hope you enjoy it!
                       DESC

  s.homepage         = 'https://blog.csdn.net/weixin_42233763?spm=1011.2415.3001.5343'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Draveness' => 'stark.draven@gmail.com' }
  s.source           = { :git => 'https://gogs.infzm.com/zhuWei/NightNight', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5'

  s.source_files = 'NightNight/Classes/**/*'
  
  s.frameworks = 'UIKit'
end
