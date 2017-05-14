Pod::Spec.new do |s|
  s.name         = "CDZTableViewManager"
  s.version      = "1.0.2"
  s.summary      = "A manager of tableview"
  s.homepage     = "https://github.com/Nemocdz/CDZTableViewManager"
  s.license      = "MIT"
  s.authors      = { 'Nemocdz' => 'nemocdz@gmail.com'}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Nemocdz/CDZTableViewManager.git", :tag => s.version }
  s.source_files = 'CDZTableViewManager', 'CDZTableViewManagerDemo/CDZTableViewManager/*.{h,m}'
  s.requires_arc = true
end
