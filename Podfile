platform :ios, '11.0'

target 'MusicPlayerTransition' do
  pod 'Hero', '1.4.0'
  pod 'SnapKit', '5.0.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['Hero'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4.2'
      end
    end
  end
end
