# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'OptimizationLevels' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for OptimizationLevels

  target 'OptimizationLevelsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  pod 'SwiftSoup', '~> 1.6'
  
  post_install do |installer|
      targetsToOptimizeAtDebug = ['SwiftSoup']
      
      installer.pods_project.targets.each do |target|
          if targetsToOptimizeAtDebug.include? target.name
              target.build_configurations.each do |config|
                  if config.name == "Debug"
                      config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
                  end
              end
          end
      end
  end

end
