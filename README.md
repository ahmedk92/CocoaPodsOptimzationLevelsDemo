# CocoaPodsOptimzationLevelsDemo
A demo representing selective optimization levels for Pods with slow Debug performance.

### Podfile

```Ruby
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
```
