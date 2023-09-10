// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

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

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum Cate {
    public static let free = DesignSystemImages(name: "free")
    public static let lyrics = DesignSystemImages(name: "lyrics")
    public static let oneline = DesignSystemImages(name: "oneline")
    public static let ost = DesignSystemImages(name: "ost")
    public static let sticker1 = DesignSystemImages(name: "sticker1")
    public static let sticker2 = DesignSystemImages(name: "sticker2")
    public static let sticker3 = DesignSystemImages(name: "sticker3")
    public static let sticker4 = DesignSystemImages(name: "sticker4")
    public static let story = DesignSystemImages(name: "story")
  }
  public enum Colors {
    public static let color1 = DesignSystemColors(name: "Color 1")
    public static let color2 = DesignSystemColors(name: "Color 2")
    public static let color3 = DesignSystemColors(name: "Color 3")
    public static let color4 = DesignSystemColors(name: "Color 4")
    public static let color5 = DesignSystemColors(name: "Color 5")
    public static let kakaoBrownLabel = DesignSystemColors(name: "kakaoBrownLabel")
    public static let kakaoYellow = DesignSystemColors(name: "kakaoYellow")
    public static let mainBackground = DesignSystemColors(name: "mainBackground")
    public static let mainBlack = DesignSystemColors(name: "mainBlack")
    public static let mainBlack3 = DesignSystemColors(name: "mainBlack3")
    public static let mainGray3 = DesignSystemColors(name: "mainGray3")
    public static let mainGray4 = DesignSystemColors(name: "mainGray4")
    public static let mainGray6 = DesignSystemColors(name: "mainGray6")
    public static let mainGray7 = DesignSystemColors(name: "mainGray7")
    public static let mainPink = DesignSystemColors(name: "mainPink")
  }
  public enum Common {
    public static let arrowLeft = DesignSystemImages(name: "arrow-left")
    public static let arrowRight = DesignSystemImages(name: "arrow_right")
    public static let bell = DesignSystemImages(name: "bell ")
    public static let check = DesignSystemImages(name: "check")
    public static let checkbox = DesignSystemImages(name: "checkbox")
    public static let empty = DesignSystemImages(name: "empty")
    public static let emptycheck = DesignSystemImages(name: "emptycheck")
    public static let more = DesignSystemImages(name: "more")
    public static let orangeright = DesignSystemImages(name: "orangeright")
  }
  public enum HomePhotos {
    public static let photo1 = DesignSystemImages(name: "photo1")
    public static let photo2 = DesignSystemImages(name: "photo2")
    public static let photo3 = DesignSystemImages(name: "photo3")
    public static let photo4 = DesignSystemImages(name: "photo4")
    public static let photo5 = DesignSystemImages(name: "photo5")
    public static let photo6 = DesignSystemImages(name: "photo6")
    public static let photo7 = DesignSystemImages(name: "photo7")
  }
  public enum Login {
    public static let kakao = DesignSystemImages(name: "Kakao")
    public static let visible1 = DesignSystemImages(name: "visible1")
    public static let visible2 = DesignSystemImages(name: "visible2")
  }
  public enum Logo {
    public static let loginlogo = DesignSystemImages(name: "loginlogo")
    public static let logo = DesignSystemImages(name: "logo")
    public static let splashLogo = DesignSystemImages(name: "splash_logo")
    public static let spotify = DesignSystemImages(name: "spotify")
    public static let spotifywithlogo = DesignSystemImages(name: "spotifywithlogo")
  }
  public enum Profile {
    public static let defaultprofile = DesignSystemImages(name: "defaultprofile")
    public static let profile = DesignSystemImages(name: "profile")
    public static let setting = DesignSystemImages(name: "setting")
  }
  public enum Record {
    public static let addImage = DesignSystemImages(name: "addImage")
    public static let albumCover = DesignSystemImages(name: "albumCover")
    public static let albumSquare = DesignSystemImages(name: "albumSquare")
    public static let edit = DesignSystemImages(name: "edit")
    public static let edit2 = DesignSystemImages(name: "edit2")
    public static let edit3 = DesignSystemImages(name: "edit3")
    public static let filter = DesignSystemImages(name: "filter")
    public static let note = DesignSystemImages(name: "note")
    public static let plusSquare = DesignSystemImages(name: "plus-square")
    public static let report = DesignSystemImages(name: "report")
  }
  public enum TabbarItems {
    public static let allrecord = DesignSystemImages(name: "allrecord")
    public static let allrecord2 = DesignSystemImages(name: "allrecord2")
    public static let home = DesignSystemImages(name: "home")
    public static let home2 = DesignSystemImages(name: "home2")
    public static let mydj = DesignSystemImages(name: "mydj")
    public static let mydj2 = DesignSystemImages(name: "mydj2")
    public static let mypage = DesignSystemImages(name: "mypage")
    public static let mypage2 = DesignSystemImages(name: "mypage2")
    public static let myrecord = DesignSystemImages(name: "myrecord")
    public static let myrecord2 = DesignSystemImages(name: "myrecord2")
  }
  public enum Utility {
    public static let emptyLove = DesignSystemImages(name: "emptyLove")
    public static let emptyStar = DesignSystemImages(name: "emptyStar")
    public static let fillLove = DesignSystemImages(name: "fillLove")
    public static let fillStar = DesignSystemImages(name: "fillStar")
    public static let instagram = DesignSystemImages(name: "instagram")
    public static let lock = DesignSystemImages(name: "lock")
    public static let sticker = DesignSystemImages(name: "sticker")
    public static let unlock = DesignSystemImages(name: "unlock")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
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
public extension SwiftUI.Color {
  init(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
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
public extension SwiftUI.Image {
  init(asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: DesignSystemImages, label: Text) {
    let bundle = DesignSystemResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: DesignSystemImages) {
    let bundle = DesignSystemResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
