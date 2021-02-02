use_frameworks!
inhibit_all_warnings!
platform :ios, '14.2'

def api_pods
#  pod 'Alamofire'
#  pod 'SwiftyJSON'
#  pod 'SDWebImageSwiftUI'
end

def firebase_pods
#  pod 'Firebase'
#  pod 'FirebaseUI'
#  pod 'Firebase/Analytics'
#  pod 'Firebase/AppDistribution'
#  pod 'Firebase/Auth'
#  pod 'Firebase/Firestore'
#  pod 'Firebase/Functions'
#  pod 'Firebase/Messaging'
#  pod 'Firebase/Storage'
#  pod 'FirebaseFirestoreSwift'
#  pod 'Firebase/Crashlytics'
#  pod 'Firebase/DynamicLinks'
#  pod 'Firebase/InAppMessaging'
#  pod 'Firebase/Performance'
#  pod 'Firebase/RemoteConfig'
end

def facebook_pods
  pod 'FBSDKCoreKit'
  pod 'FBSDKLoginKit'
  pod 'FBSDKShareKit'
end

def pusher_pods
#  pod 'PushNotifications'
#  pod 'PusherSwift'
end

def google_pods
  pod 'Google-Mobile-Ads-SDK'
  pod 'GoogleSignIn'
end

def ui_pods
#  pod 'lottie-ios'
#  pod 'SwiftGen'
end

def utils_pods
  pod 'SwiftLint'
end

def analytics_pods
#  pod 'AppsFlyerFramework'
#  pod 'Rollbar', '~> 1.4.2'
#  pod 'Heap', '~> 7.0'
#  pod 'Instabug'
#  pod 'Flurry-iOS-SDK/FlurrySDK'
#  pod 'Bugsee'
#  pod 'YandexMobileMetrica/Dynamic', '3.12.0'
#  pod 'AppCenter'
#  pod 'Adjust'
#  pod 'Branch'
#  pod 'Mixpanel-swift'
#  pod 'Amplitude', '~> 5.0.0'
#  pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '6.0.6'
end

abstract_target 'MercutioProject' do
  
#  api_pods
#  firebase_pods
#  google_pods
#  ui_pods
  
  target 'Mercutio' do
#    facebook_pods
#    pusher_pods
    utils_pods
#    analytics_pods
  end
  
  target 'MFramework' do
    inherit! :search_paths
#    api_pods
#    facebook_pods
#    google_pods
#    ui_pods
  end
  
  target 'MercutioTests' do
  end
  
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.2'
      end
    end
end
