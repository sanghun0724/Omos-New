// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  internal enum Common {
    /// 
    internal static let complete = Strings.tr("Localizable", "common.complete", fallback: "")
    /// Localizable.strings
    ///   RIBsReactorKit
    /// 
    ///   Created by elon on 2021/03/01.
    ///   Copyright © 2021 Elon. All rights reserved.
    internal static let next = Strings.tr("Localizable", "common.next", fallback: "")
  }
  internal enum Onboarding {
    /// 
    internal static let email = Strings.tr("Localizable", "onboarding.email", fallback: "")
    /// 
    internal static let emailwarning = Strings.tr("Localizable", "onboarding.emailwarning", fallback: "")
    /// 
    internal static let kakao = Strings.tr("Localizable", "onboarding.kakao", fallback: "")
    /// 
    internal static let loggedIn = Strings.tr("Localizable", "onboarding.loggedIn", fallback: "")
    /// 
    internal static let loginButton = Strings.tr("Localizable", "onboarding.loginButton", fallback: "")
    /// 
    internal static let nickname = Strings.tr("Localizable", "onboarding.nickname", fallback: "")
    /// 
    internal static let nicknameWarning = Strings.tr("Localizable", "onboarding.nicknameWarning", fallback: "")
    /// 
    internal static let password = Strings.tr("Localizable", "onboarding.password", fallback: "")
    /// 
    internal static let passwordwarning = Strings.tr("Localizable", "onboarding.passwordwarning", fallback: "")
    /// 
    internal static let repasswordInvalidation = Strings.tr("Localizable", "onboarding.repasswordInvalidation", fallback: "")
    /// 
    internal static let sendCertificationEmail = Strings.tr("Localizable", "onboarding.sendCertificationEmail", fallback: "")
    /// 
    internal static let signUp = Strings.tr("Localizable", "onboarding.signUp", fallback: "")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
