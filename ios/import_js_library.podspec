#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'import_js_library'
  s.version          = '1.0.0'
  s.summary          = 'No-op implementation of import_js_library web plugin to avoid build issues on iOS'
  s.description      = <<-DESC
temp fake url_launcher_web plugin
                       DESC
  s.homepage         = 'https://github.com/florent37/import_js_library'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Florent Champigny' => 'champigny.florent@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
  s.platform = :ios, '8.0'

end