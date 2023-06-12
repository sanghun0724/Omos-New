// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum Colors {
    internal static let color1 = ColorAsset(name: "Color 1")
    internal static let color2 = ColorAsset(name: "Color 2")
    internal static let color3 = ColorAsset(name: "Color 3")
    internal static let color4 = ColorAsset(name: "Color 4")
    internal static let color5 = ColorAsset(name: "Color 5")
    internal static let color6 = ColorAsset(name: "Color 6")
    internal static let color7 = ColorAsset(name: "Color 7")
    internal static let kakaoBrownLabel = ColorAsset(name: "kakaoBrownLabel")
    internal static let kakaoYellow = ColorAsset(name: "kakaoYellow")
    internal static let mainBackground = ColorAsset(name: "mainBackground")
    internal static let mainBlack = ColorAsset(name: "mainBlack")
    internal static let mainGray4 = ColorAsset(name: "mainGray4")
    internal static let mainGray6 = ColorAsset(name: "mainGray6")
    internal static let mainGray7 = ColorAsset(name: "mainGray7")
    internal static let mainOrange = ColorAsset(name: "mainOrange")
  }
  internal enum Images {
    internal enum Common {
      internal static let arrowLeft = ImageAsset(name: "arrow-left")
      internal static let bell = ImageAsset(name: "bell ")
      internal static let check = ImageAsset(name: "check")
      internal static let empty = ImageAsset(name: "empty")
      internal static let keyboardArrowLeft = ImageAsset(name: "keyboard_arrow_left")
      internal static let more = ImageAsset(name: "more")
      internal static let orangeright = ImageAsset(name: "orangeright")
    }
    internal enum HomePhotos {
      internal static let photo1 = ImageAsset(name: "photo1")
      internal static let photo2 = ImageAsset(name: "photo2")
      internal static let photo3 = ImageAsset(name: "photo3")
      internal static let photo4 = ImageAsset(name: "photo4")
      internal static let photo5 = ImageAsset(name: "photo5")
      internal static let photo6 = ImageAsset(name: "photo6")
      internal static let photo7 = ImageAsset(name: "photo7")
    }
    internal enum Login {
      internal static let kakao = ImageAsset(name: "Kakao")
      internal static let visible1 = ImageAsset(name: "visible1")
      internal static let visible2 = ImageAsset(name: "visible2")
    }
    internal enum Logo {
      internal static let loginlogo = ImageAsset(name: "loginlogo")
      internal static let logo = ImageAsset(name: "logo")
      internal static let splashLogo = ImageAsset(name: "splash_logo")
      internal static let spotify = ImageAsset(name: "spotify")
      internal static let spotifywithlogo = ImageAsset(name: "spotifywithlogo")
    }
    internal enum Profile {
      internal static let defaultprofile = ImageAsset(name: "defaultprofile")
      internal static let profile = ImageAsset(name: "profile")
      internal static let setting = ImageAsset(name: "setting")
    }
    internal enum Record {
      internal static let addImage = ImageAsset(name: "addImage")
      internal static let albumCover = ImageAsset(name: "albumCover")
      internal static let albumSquare = ImageAsset(name: "albumSquare")
      internal static let edit = ImageAsset(name: "edit")
      internal static let edit2 = ImageAsset(name: "edit2")
      internal static let edit3 = ImageAsset(name: "edit3")
      internal static let filter = ImageAsset(name: "filter")
      internal static let note = ImageAsset(name: "note")
      internal static let plusSquare = ImageAsset(name: "plus-square")
      internal static let report = ImageAsset(name: "report")
    }
    internal enum TabbarItems {
      internal static let allrecord = ImageAsset(name: "allrecord")
      internal static let allrecord2 = ImageAsset(name: "allrecord2")
      internal static let home = ImageAsset(name: "home")
      internal static let home2 = ImageAsset(name: "home2")
      internal static let mydj = ImageAsset(name: "mydj")
      internal static let mydj2 = ImageAsset(name: "mydj2")
      internal static let mypage = ImageAsset(name: "mypage")
      internal static let mypage2 = ImageAsset(name: "mypage2")
      internal static let myrecord = ImageAsset(name: "myrecord")
      internal static let myrecord2 = ImageAsset(name: "myrecord2")
    }
    internal enum Utility {
      internal static let emptyLove = ImageAsset(name: "emptyLove")
      internal static let emptyStar = ImageAsset(name: "emptyStar")
      internal static let fillLove = ImageAsset(name: "fillLove")
      internal static let fillStar = ImageAsset(name: "fillStar")
      internal static let instagram = ImageAsset(name: "instagram")
      internal static let lock = ImageAsset(name: "lock")
      internal static let sticker = ImageAsset(name: "sticker")
      internal static let unlock = ImageAsset(name: "unlock")
    }
    internal enum Cate {
      internal static let free = ImageAsset(name: "free")
      internal static let lyrics = ImageAsset(name: "lyrics")
      internal static let oneline = ImageAsset(name: "oneline")
      internal static let ost = ImageAsset(name: "ost")
      internal static let sticker1 = ImageAsset(name: "sticker1")
      internal static let sticker2 = ImageAsset(name: "sticker2")
      internal static let sticker3 = ImageAsset(name: "sticker3")
      internal static let sticker4 = ImageAsset(name: "sticker4")
      internal static let story = ImageAsset(name: "story")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

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
