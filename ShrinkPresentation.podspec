Pod::Spec.new do |s|

  s.name         = "ShrinkPresentation"
  s.version      = "0.1.0"
  s.summary      = "A way to shrink the previous view controller when presenting a new one modally."
  s.homepage     = "https://github.com/GuiminChu/ShrinkPresentation"

  s.license      = "MIT"

  s.author                = { "GuiminChu" => "455824173@qq.com" }
  s.social_media_url      = "http://weibo.com/cookcode"

  s.platform              = :ios, "8.0"
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/GuiminChu/ShrinkPresentation.git", :tag => "0.1.0" }
  s.source_files = "Source"

  s.requires_arc = true

end
