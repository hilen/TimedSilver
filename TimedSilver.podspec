Pod::Spec.new do |s|
  s.name             = "TimedSilver"
  s.version          = "1.1.0"
  s.summary          = "TimedSilver: A collection of swift extensions."
  s.description      = <<-DESC
                       All about swift extension, a collection of useful Swift extensions extending iOS Frameworks such as Foundation, UIKit, swift struct and so on. This would help you to quickly build your swift applications.
                       DESC
  s.homepage         = "https://github.com/hilen/TimedSilver"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Hilen" => "hilenkz@gmail.com" }
  s.source           = { :git => "https://github.com/hilen/TimedSilver.git", :tag => s.version.to_s }
  s.ios.deployment_target = "8.0"
  s.requires_arc = true
  s.platform     = :ios, "8.0"
  s.source_files = "Sources/**/*.swift","Sources/*.{h,swift}"
  s.frameworks = 'Foundation', 'UIKit', 'QuartzCore', 'AVFoundation'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
end
