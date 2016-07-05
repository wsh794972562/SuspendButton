#
#  Be sure to run `pod spec lint SuspendButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name     = 'SuspendButton'
s.version  = '1.0'
s.license  = "MIT"  //开源协议
s.summary  = 'This is a suspend button' //简单的描述
s.homepage = 'https://github.com/wsh794972562/SuspendButton' //主页
s.author   = { 'shwu' => '794972562@qq.com' } //作者
s.source   = { :git => 'https://github.com/wsh794972562/SuspendButton.git', :tag => "1.0" } //git路径、指定tag号
s.platform = :ios
s.source_files = 'SuspendButton/*'  //库的源代码文件
s.framework = 'UIKit'  //依赖的framework
s.requires_arc = true
end