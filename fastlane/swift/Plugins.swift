import Foundation
/**
 Release your beta builds with Firebase App Distribution

 - parameters:
   - ipaPath: Path to your IPA file. Optional if you use the _gym_ or _xcodebuild_ action
   - googleserviceInfoPlistPath: Path to your GoogleService-Info.plist file, relative to the root of your Xcode project
   - apkPath: Path to your APK file
   - app: Your app's Firebase App ID. You can find the App ID in the Firebase console, on the General Settings page
   - firebaseCliPath: **DEPRECATED!** This plugin no longer uses the Firebase CLI - The absolute path of the firebase cli command
   - groups: The groups used for distribution, separated by commas
   - groupsFile: The groups used for distribution, separated by commas
   - testers: Pass email addresses of testers, separated by commas
   - testersFile: Pass email addresses of testers, separated by commas
   - releaseNotes: Release notes for this build
   - releaseNotesFile: Release notes file for this build
   - firebaseCliToken: Auth token for firebase cli
   - debug: Print verbose debug output
   - serviceCredentialsFile: Path to Google service account json

 Release your beta builds with Firebase App Distribution
*/
public func firebaseAppDistribution(ipaPath: String? = nil,
                                    googleserviceInfoPlistPath: String = "GoogleService-Info.plist",
                                    apkPath: String? = nil,
                                    app: String? = nil,
                                    firebaseCliPath: String? = nil,
                                    groups: String? = nil,
                                    groupsFile: String? = nil,
                                    testers: String? = nil,
                                    testersFile: String? = nil,
                                    releaseNotes: String? = nil,
                                    releaseNotesFile: String? = nil,
                                    firebaseCliToken: String? = nil,
                                    debug: Bool = false,
                                    serviceCredentialsFile: String? = nil) {
  let command = RubyCommand(commandID: "", methodName: "firebase_app_distribution", className: nil, args: [RubyCommand.Argument(name: "ipa_path", value: ipaPath),
                                                                                                           RubyCommand.Argument(name: "googleservice_info_plist_path", value: googleserviceInfoPlistPath),
                                                                                                           RubyCommand.Argument(name: "apk_path", value: apkPath),
                                                                                                           RubyCommand.Argument(name: "app", value: app),
                                                                                                           RubyCommand.Argument(name: "firebase_cli_path", value: firebaseCliPath),
                                                                                                           RubyCommand.Argument(name: "groups", value: groups),
                                                                                                           RubyCommand.Argument(name: "groups_file", value: groupsFile),
                                                                                                           RubyCommand.Argument(name: "testers", value: testers),
                                                                                                           RubyCommand.Argument(name: "testers_file", value: testersFile),
                                                                                                           RubyCommand.Argument(name: "release_notes", value: releaseNotes),
                                                                                                           RubyCommand.Argument(name: "release_notes_file", value: releaseNotesFile),
                                                                                                           RubyCommand.Argument(name: "firebase_cli_token", value: firebaseCliToken),
                                                                                                           RubyCommand.Argument(name: "debug", value: debug),
                                                                                                           RubyCommand.Argument(name: "service_credentials_file", value: serviceCredentialsFile)])
  _ = runner.executeCommand(command)
}

/**
 Authenticate with Firebase App Distribution using a Google account.

 Log in to Firebase App Distribution using a Google account to generate an authentication token. This token is stored within an environment variable and used to authenticate with your Firebase project. See https://firebase.google.com/docs/app-distribution/ios/distribute-fastlane for more information.
*/
public func firebaseAppDistributionLogin() {
  let command = RubyCommand(commandID: "", methodName: "firebase_app_distribution_login", className: nil, args: [])
  _ = runner.executeCommand(command)
}

/**
 Upload dSYM symbolication files to AppMetrica

 - parameters:
   - binaryPath: The path to 'helper' binary in AppMetrica framework
   - postApiKey: Post API key. This mandatory parameter is used to upload dSYMs to AppMetrica
   - packageOutputPath: The path where temporary archives are stored. If not specified, default system's temporary directory used instead
   - verbose: Verbose mode. Displays additional information
   - files: An optional list of dSYM files or directories that contain these files to upload. If not specified, the local working directory used by default

 This plugin allows uploading dSYM symbolication files to AppMetrica. It should be applied if you use Bitcode
*/
public func uploadSymbolsToAppmetrica(binaryPath: String? = nil,
                                      postApiKey: String,
                                      packageOutputPath: String? = nil,
                                      verbose: String? = nil,
                                      files: [String]? = nil) {
  let command = RubyCommand(commandID: "", methodName: "upload_symbols_to_appmetrica", className: nil, args: [RubyCommand.Argument(name: "binary_path", value: binaryPath),
                                                                                                              RubyCommand.Argument(name: "post_api_key", value: postApiKey),
                                                                                                              RubyCommand.Argument(name: "package_output_path", value: packageOutputPath),
                                                                                                              RubyCommand.Argument(name: "verbose", value: verbose),
                                                                                                              RubyCommand.Argument(name: "files", value: files)])
  _ = runner.executeCommand(command)
}
