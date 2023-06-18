// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum DesignSystemStrings {

  public enum Common {
    /// 
    public static let complete = DesignSystemStrings.tr("Localizable", "common.complete")
    /// 
    public static let next = DesignSystemStrings.tr("Localizable", "common.next")
  }

  public enum Onboarding {
    /// 
    public static let email = DesignSystemStrings.tr("Localizable", "onboarding.email")
    /// 
    public static let emailwarning = DesignSystemStrings.tr("Localizable", "onboarding.emailwarning")
    /// 
    public static let kakao = DesignSystemStrings.tr("Localizable", "onboarding.kakao")
    /// 
    public static let loggedIn = DesignSystemStrings.tr("Localizable", "onboarding.loggedIn")
    /// 
    public static let loginButton = DesignSystemStrings.tr("Localizable", "onboarding.loginButton")
    /// 
    public static let nickname = DesignSystemStrings.tr("Localizable", "onboarding.nickname")
    /// 
    public static let nicknameWarning = DesignSystemStrings.tr("Localizable", "onboarding.nicknameWarning")
    /// 
    public static let password = DesignSystemStrings.tr("Localizable", "onboarding.password")
    /// 
    public static let passwordwarning = DesignSystemStrings.tr("Localizable", "onboarding.passwordwarning")
    /// 
    public static let repasswordInvalidation = DesignSystemStrings.tr("Localizable", "onboarding.repasswordInvalidation")
    /// 
    public static let sendCertificationEmail = DesignSystemStrings.tr("Localizable", "onboarding.sendCertificationEmail")
    /// 
    public static let signUp = DesignSystemStrings.tr("Localizable", "onboarding.signUp")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension DesignSystemStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = DesignSystemResources.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftlint:enable all
// swiftformat:enable all
