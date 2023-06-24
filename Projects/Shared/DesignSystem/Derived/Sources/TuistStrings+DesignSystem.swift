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
    /// 완료
    public static let complete = DesignSystemStrings.tr("Localizable", "common.complete")
    /// 다음
    public static let next = DesignSystemStrings.tr("Localizable", "common.next")
  }

  public enum Onboarding {
    /// 이메일
    public static let email = DesignSystemStrings.tr("Localizable", "onboarding.email")
    /// 올바른 이메일 형식이 아니에요.
    public static let emailwarning = DesignSystemStrings.tr("Localizable", "onboarding.emailwarning")
    ///   Kakao로 로그인
    public static let kakao = DesignSystemStrings.tr("Localizable", "onboarding.kakao")
    /// 로그인
    public static let loggedIn = DesignSystemStrings.tr("Localizable", "onboarding.loggedIn")
    /// 닉네임
    public static let nickname = DesignSystemStrings.tr("Localizable", "onboarding.nickname")
    /// 이미 쓰고 있는 닉네임이에요.
    public static let nicknameWarning = DesignSystemStrings.tr("Localizable", "onboarding.nicknameWarning")
    /// 비밀번호
    public static let password = DesignSystemStrings.tr("Localizable", "onboarding.password")
    /// 8~16자의 영문 대소문자, 숫자, 특수문자만 가능해요.
    public static let passwordwarning = DesignSystemStrings.tr("Localizable", "onboarding.passwordwarning")
    /// 재확인 비밀번호가 틀립니다.
    public static let repasswordInvalidation = DesignSystemStrings.tr("Localizable", "onboarding.repasswordInvalidation")
    /// 인증메일 보내기
    public static let sendCertificationEmail = DesignSystemStrings.tr("Localizable", "onboarding.sendCertificationEmail")
    /// 회원가입
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
