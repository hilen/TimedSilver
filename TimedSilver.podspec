Pod::Spec.new do |s|
  s.name             = "TimedSilver"
  s.version          = "0.0.1"
  s.summary          = "TimedSilver: A collection of swift extensions."
  s.description      = <<-DESC
                       All about swift extension, a collection of useful Swift extensions extending iOS Frameworks such as Foundation, UIKit, swift struct and so on. This would help you to quickly build your swift applications
                       DESC
  s.homepage         = "https://github.com/hilen/TimedSilver"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Hilen" => "hilenkz@gmail.com" }
  s.source           = { :git => "https://github.com/hilen/TimedSilver.git", :commit => '5051b61b789588e87384e8c1d92c5d8f7eff9f2a' }
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.platform     = :ios, "8.0"
  s.source_files = "TimedSilver/**/*.swift","TimedSilver"
  s.frameworks = 'Foundation', 'UIKit', 'QuartzCore', 'CoreLocation', 'MapKit', 'AVFoundation'
end
