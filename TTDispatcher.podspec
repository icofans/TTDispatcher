Pod::Spec.new do |s|
  s.name             = 'TTDispatcher'
  s.version          = '0.1.0'
  s.summary          = '组件化分离appdelegate'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/icofans/TTDispatcher'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'icofans' => '565057208@qq.com' }
  s.source           = { :git => 'https://github.com/icofans/TTDispatcher.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'TTDispatcher/Classes/**/*'
end
