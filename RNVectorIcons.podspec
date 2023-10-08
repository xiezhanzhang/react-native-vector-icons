# require 'json'
# version = JSON.parse(File.read('package.json'))["version"]

# fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'
# folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

# folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

# Pod::Spec.new do |s|

#   s.name           = "RNVectorIcons"
#   s.version        = version
#   s.summary        = "Customizable Icons for React Native with support for NavBar/TabBar, image source and full styling."
#   s.homepage       = "https://github.com/oblador/react-native-vector-icons"
#   s.license        = "MIT"
#   s.author         = { "Joel Arvidsson" => "joel@oblador.se" }
#   # s.platforms      = { :ios => "9.0", :tvos => "9.0" }
#   s.platforms      = { :ios => "12.4", :tvos => "9.0" }
#   s.source         = { :git => "https://github.com/oblador/react-native-vector-icons.git", :tag => "v#{s.version}" }
#   s.source_files   = 'RNVectorIconsManager/**/*.{h,m}'
#   s.resources      = "Fonts/*.ttf"
#   s.preserve_paths = "**/*.js"
#   s.dependency 'React-Core'

#   # This guard prevent to install the dependencies when we run `pod install` in the old architecture.
#   if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
#       s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
#       s.pod_target_xcconfig    = {
#           "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
#           "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
#       }

#       s.dependency "React-Codegen"
#       s.dependency "RCT-Folly"
#       s.dependency "RCTRequired"
#       s.dependency "RCTTypeSafety"
#       s.dependency "ReactCommon/turbomodule/core"
#   end

# end
require 'json'
version = JSON.parse(File.read('package.json'))["version"]

fabric_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|

  s.name           = "RNVectorIcons"
  s.version        = version
  s.summary        = "Customizable Icons for React Native with support for NavBar/TabBar, image source and full styling."
  s.homepage       = "https://github.com/oblador/react-native-vector-icons"
  s.license        = "MIT"
  s.author         = { "Joel Arvidsson" => "joel@oblador.se" }
  s.platforms      = { :ios => "12.4", :tvos => "9.0" }
  s.source         = { :git => "https://github.com/oblador/react-native-vector-icons.git", :tag => "v#{s.version}" }
  s.source_files   = 'RNVectorIconsManager/**/*.{h,m,mm,swift}'
  s.resources      = "Fonts/*.ttf"
  s.preserve_paths = "**/*.js"
  s.pod_target_xcconfig = {
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
  }

  if fabric_enabled
    s.dependency "React-utils"
    s.subspec "xxxutils" do |ss|
      ss.dependency "ReactCommon"
      ss.dependency "React-utils"
      ss.source_files         = "react/utils/**/*.{cpp,h}"
      ss.header_dir           = "react/utils"
      ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"${PODS_CONFIGURATION_BUILD_DIR}/React-utils/React_utils.framework/Headers\"" }
    end
  end

  install_modules_dependencies(s)

end
