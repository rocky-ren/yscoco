Pod::Spec.new do |s|  
  s.name             = “Yscoco”  
  s.version          = "1.0.0"  
  s.summary          = “Yscoco.”  
  s.description      = <<-DESC  
                       It is a util used on iOS, which implement by Objective-C.  
                       DESC  
  s.homepage         = "https://github.com/rocky-ren/yscoco"  
  s.license          = 'MIT'  
  s.author           = { “Rocky” => “rwpnyn@163.com" }  
  s.source           = { :git => "https://github.com/rocky-ren/yscoco.git", :tag => s.version.to_s }  
  # s.social_media_url = 'https://twitter.com/NAME'  
  
  s.platform     = :ios, ‘8.0’  
  # s.ios.deployment_target = '5.0'  
  # s.osx.deployment_target = '10.10.5’  
  s.requires_arc = true  
  
  s.source_files = ‘Yscoco/*’  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.h'  
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
end