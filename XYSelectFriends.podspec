Pod::Spec.new do |s|
  s.name         = "XYSelectFriends"
  s.version      = "0.0.1"
  s.summary      = "高仿微信群组添加/删除好友/群组设置页面(集成简单)"

  s.description  = <<-DESC
             高仿微信群组添加/删除好友/群组设置页面，开放各个点击事件接口，很方便!

                   DESC

  s.homepage     = "https://github.com/cryboyofyu/XYSelectFriends"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "LV" => "cryboyofyu@gmail.com" }

  # s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/cryboyofyu/XYSelectFriends", :tag => "0.0.1" }

  s.source_files  = "XYSelectFriends/XYSelectFriends/*.{h,m}"
  s.resources = 'XYSelectFriends/XYSelectFriends/XYImgs/*.{jpg,png}'

  s.framework = 'UIKit'

    s.dependency 'SDWebImage'
    s.dependency 'MBProgressHUD'


end
