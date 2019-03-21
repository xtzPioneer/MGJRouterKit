#
# Be sure to run `pod lib lint MGJRouterKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  # 组件名称
  s.name             = 'MGJRouterKit'
  # 组件版本
  s.version          = '0.1.1'
  # 组件概要说明
  s.summary          = '蘑菇街路由器套件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  # 组件详细说明
  s.description      = <<-DESC
  蘑菇街路由器套件,在该基础之上进行了扩展,使其更加简单快捷.
                       DESC
  # 首页地址
  s.homepage         = 'https://github.com/xtzPioneer/MGJRouterKit'

  # 截图
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'

  # 许可
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  # 作者
  s.author           = { 'xtzPioneer' => 'xtz_pioneer@163.com' }

  # 资源所在地
  s.source           = { :git => 'https://github.com/xtzPioneer/MGJRouterKit.git', :tag => s.version.to_s }

  # 社交URL
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # 支持的版本
  s.ios.deployment_target = '8.0'

  # 资源文件
  s.source_files = 'MGJRouterKit/Classes/**/*.{h,m}'

  # 依赖
  s.dependency 'MGJRouter'
  
  # 公开的头文件
  s.prefix_header_contents = '#import "MGJRouterKit.h"'
  
  # 资源包
  # s.resource_bundles = {
  #   'TXPublicSetKit' => ['TXPublicSetKit/Assets/*.png']
  # }
  
  # 依赖的系统framework库
  # s.frameworks = 'UIKit', 'MapKit'
  
  # 依赖的第三方framework库
  
  # s.vendored_frameworks = 'MessageModule/Classes/**/*.{framework}'
  
  # 依赖的第三方.a库
  # s.vendored_libraries = 'RecordModule/Classes/**/*.{a}'
  
  # 依赖的系统非framework库
  # s.libraries = 'sqlite3.0'
  
end
