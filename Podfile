platform :ios, '13.0'

target 'onepMaker' do
  use_frameworks!

  pod 'RealmSwift', '~>10'
#  pod 'SwiftyJSON', '~> 4.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'Realm'
      create_symlink_phase = target.shell_script_build_phases.find { |x| x.name == 'Create Symlinks to Header Folders' }
      create_symlink_phase.always_out_of_date = "1"
    end
    
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
