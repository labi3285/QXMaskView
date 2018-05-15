Pod::Spec.new do |s|

  s.name         = "QXMaskView"
  s.version      = "0.0.3"
  s.summary      = "A easy use and customize mask view shower in swift."
  s.description  = <<-DESC
                    Fix a carsh bug when phone is low power.
                   DESC
  s.homepage     = "https://github.com/labi3285/QXMaskView"
  s.license      = "MIT"
  s.author       = { "labi3285" => "766043285@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/labi3285/QXMaskView.git", :tag => "#{s.version}" }
  s.source_files  = "QXMaskView/QXMaskView/*.swift"
  s.requires_arc = true

end
