Pod::Spec.new do |s|

  s.name         = "QXMaskView"
  s.version      = "0.0.1"
  s.summary      = "A easy use and customize mask view shower in swift."
  s.description  = <<-DESC
                    A easy customize tip shower for show success, failure, warning etc. Just enjoy!
                   DESC
  s.homepage     = "https://github.com/labi3285/QXMessageView"
  s.license      = "MIT"
  s.author       = { "labi3285" => "766043285@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/labi3285/QXMessageView.git", :tag => "#{s.version}" }
  s.source_files  = "QXMaskView/QXMaskView/*.swift"
  s.requires_arc = true

end
