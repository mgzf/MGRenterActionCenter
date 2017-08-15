Pod::Spec.new do |s|
  s.name             = "MGRenterActionCenter"
  s.version          = "0.0.1"
  s.license          = 'MIT License'
  s.summary          = "MGRenterActionCenter"
  s.description      = "MGRenterActionCenter"
  s.homepage         = "https://github.com/mgzf/MGRenterActionCenter"

  s.author           = { "Harly" => "magic_harly@hotmail.com" }
  s.source           = { :git => "https://github.com/mgzf/MGRenterActionCenter.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files  = "MGRenterActionCenter/CenterSources/**/*.swift"
  s.dependency "DeeplinkNavigator"
end
