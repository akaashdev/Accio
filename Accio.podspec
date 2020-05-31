
Pod::Spec.new do |s|
  s.name             = 'Accio'
  s.version          = '0.1.0'
  s.summary          = 'Collection of Util methods to make building Programmatic UI simple, easy and enjoyable!'
  s.description      = <<-DESC
Accio is a Collection of Layout Util methods to help developers build Programmatic UI very fast and easy. It completely follows AutoLayout under the hood. It uses declarative approach to do stuff. The main goal of Accio is to remove huge chunks of redundant constraints methods and have a more readable and simple code.
                       DESC

  s.homepage         = 'https://github.com/akaashdev/Accio.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akaash Dev' => 'heatblast.akaash@gmail.com' }
  s.source           = { :git => 'https://github.com/akaashdev/Accio.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/akaash_dev'

  s.ios.deployment_target = '10.0'
  s.source_files = 'Accio/Classes/**/*'
end
