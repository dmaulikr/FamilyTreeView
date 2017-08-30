Pod::Spec.new do |s|
  s.name         = "FamilyTreeView"
  s.version      = "1.0.0"
  s.summary      = "An iOS family tree view."
  s.description  = <<-DESC
                    FamilyTreeView is an Objective-C class that builds and displays a family tree.
                   DESC
  s.homepage     = "https://github.com/chenyun122/FamilyTreeView"
  s.screenshots  = "https://raw.githubusercontent.com/chenyun122/FamilyTreeView/master/Screenshot170830.PNG"
  s.license      = "MIT"
  s.author             = { "Yun Chen" => "chenyun122@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/chenyun122/FamilyTreeView.git", :tag => "#{s.version}" }
  s.source_files  = "FamilyTreeView", "FamilyTreeView/**/*.{h,m}"
  s.resource_bundles = {
    'FamilyTreeView' => ['Pod/FamilyTreeView/**/*.{xib,xcassets}']
  }
end
