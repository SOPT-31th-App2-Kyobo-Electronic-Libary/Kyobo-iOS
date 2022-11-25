//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 2 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `color_test`.
    static let color_test = Rswift.ColorResource(bundle: R.hostingBundle, name: "color_test")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "color_test", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func color_test(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.color_test, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "color_test", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func color_test(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.color_test.name)
    }
    #endif

    /// This `R.color.kyobo` struct is generated, and contains static references to 9 colors.
    struct kyobo {
      /// Color `_Black`.
      static let _Black = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Black")
      /// Color `_Blue`.
      static let _Blue = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Blue")
      /// Color `_Dark_gray`.
      static let _Dark_gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Dark_gray")
      /// Color `_Gray`.
      static let _Gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Gray")
      /// Color `_Green`.
      static let _Green = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Green")
      /// Color `_Light_Green`.
      static let _Light_Green = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Light_Green")
      /// Color `_Light_gray`.
      static let _Light_gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Light_gray")
      /// Color `_Red`.
      static let _Red = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_Red")
      /// Color `_White`.
      static let _White = Rswift.ColorResource(bundle: R.hostingBundle, name: "kyobo/_White")

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Black", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Black(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Black, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Blue", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Blue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Blue, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Dark_gray", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Dark_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Dark_gray, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Gray", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Gray, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Green", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Green(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Green, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Light_Green", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Light_Green(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Light_Green, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Light_gray", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Light_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Light_gray, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_Red", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _Red(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._Red, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIColor(named: "_White", bundle: ..., traitCollection: ...)`
      @available(tvOS 11.0, *)
      @available(iOS 11.0, *)
      static func _White(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
        return UIKit.UIColor(resource: R.color.kyobo._White, compatibleWith: traitCollection)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Black", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Black(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Black.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Blue", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Blue(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Blue.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Dark_gray", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Dark_gray(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Dark_gray.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Gray", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Gray(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Gray.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Green", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Green(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Green.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Light_Green", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Light_Green(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Light_Green.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Light_gray", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Light_gray(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Light_gray.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_Red", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _Red(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._Red.name)
      }
      #endif

      #if os(watchOS)
      /// `UIColor(named: "_White", bundle: ..., traitCollection: ...)`
      @available(watchOSApplicationExtension 4.0, *)
      static func _White(_: Void = ()) -> UIKit.UIColor? {
        return UIKit.UIColor(named: R.color.kyobo._White.name)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `AppleSDGothicNeo.ttc`.
    static let appleSDGothicNeoTtc = Rswift.FileResource(bundle: R.hostingBundle, name: "AppleSDGothicNeo", pathExtension: "ttc")

    /// `bundle.url(forResource: "AppleSDGothicNeo", withExtension: "ttc")`
    static func appleSDGothicNeoTtc(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.appleSDGothicNeoTtc
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 21 images.
  struct image {
    /// Image `Frame 59480`.
    static let frame59480 = Rswift.ImageResource(bundle: R.hostingBundle, name: "Frame 59480")
    /// Image `Frame 59509`.
    static let frame59509 = Rswift.ImageResource(bundle: R.hostingBundle, name: "Frame 59509")
    /// Image `back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "back")
    /// Image `category_icon`.
    static let category_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "category_icon")
    /// Image `category_selected_icon`.
    static let category_selected_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "category_selected_icon")
    /// Image `home_icon`.
    static let home_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "home_icon")
    /// Image `home_selected_icon`.
    static let home_selected_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "home_selected_icon")
    /// Image `kyobo_icon_logout`.
    static let kyobo_icon_logout = Rswift.ImageResource(bundle: R.hostingBundle, name: "kyobo_icon_logout")
    /// Image `kyobo_icon_settings`.
    static let kyobo_icon_settings = Rswift.ImageResource(bundle: R.hostingBundle, name: "kyobo_icon_settings")
    /// Image `library_search_icon`.
    static let library_search_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "library_search_icon")
    /// Image `magnify_icon`.
    static let magnify_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "magnify_icon")
    /// Image `magnify`.
    static let magnify = Rswift.ImageResource(bundle: R.hostingBundle, name: "magnify")
    /// Image `myPage_icon`.
    static let myPage_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "myPage_icon")
    /// Image `myPage_selected_icon`.
    static let myPage_selected_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "myPage_selected_icon")
    /// Image `notificationBox_icon`.
    static let notificationBox_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "notificationBox_icon")
    /// Image `notificationBox_selected_icon`.
    static let notificationBox_selected_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "notificationBox_selected_icon")
    /// Image `recent_search_1`.
    static let recent_search_1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_1")
    /// Image `recent_search_2`.
    static let recent_search_2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_2")
    /// Image `recent_search_3`.
    static let recent_search_3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_3")
    /// Image `sampleBook_img`.
    static let sampleBook_img = Rswift.ImageResource(bundle: R.hostingBundle, name: "sampleBook_img")
    /// Image `star_icon`.
    static let star_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "star_icon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Frame 59480", bundle: ..., traitCollection: ...)`
    static func frame59480(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.frame59480, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Frame 59509", bundle: ..., traitCollection: ...)`
    static func frame59509(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.frame59509, compatibleWith: traitCollection)
    /// Image `recent_search_1`.
    static let recent_search_1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_1")
    /// Image `recent_search_2`.
    static let recent_search_2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_2")
    /// Image `recent_search_3`.
    static let recent_search_3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "recent_search_3")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "category_icon", bundle: ..., traitCollection: ...)`
    static func category_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "category_selected_icon", bundle: ..., traitCollection: ...)`
    static func category_selected_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.category_selected_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "home_icon", bundle: ..., traitCollection: ...)`
    static func home_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.home_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "home_selected_icon", bundle: ..., traitCollection: ...)`
    static func home_selected_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.home_selected_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "kyobo_icon_logout", bundle: ..., traitCollection: ...)`
    static func kyobo_icon_logout(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.kyobo_icon_logout, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "kyobo_icon_settings", bundle: ..., traitCollection: ...)`
    static func kyobo_icon_settings(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.kyobo_icon_settings, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "library_search_icon", bundle: ..., traitCollection: ...)`
    static func library_search_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.library_search_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "magnify", bundle: ..., traitCollection: ...)`
    static func magnify(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.magnify, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "magnify_icon", bundle: ..., traitCollection: ...)`
    static func magnify_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.magnify_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "myPage_icon", bundle: ..., traitCollection: ...)`
    static func myPage_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.myPage_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "myPage_selected_icon", bundle: ..., traitCollection: ...)`
    static func myPage_selected_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.myPage_selected_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "notificationBox_icon", bundle: ..., traitCollection: ...)`
    static func notificationBox_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.notificationBox_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "notificationBox_selected_icon", bundle: ..., traitCollection: ...)`
    static func notificationBox_selected_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.notificationBox_selected_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "recent_search_1", bundle: ..., traitCollection: ...)`
    static func recent_search_1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "recent_search_2", bundle: ..., traitCollection: ...)`
    static func recent_search_2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "recent_search_3", bundle: ..., traitCollection: ...)`
    static func recent_search_3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_3, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sampleBook_img", bundle: ..., traitCollection: ...)`
    static func sampleBook_img(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sampleBook_img, compatibleWith: traitCollection)
    /// `UIImage(named: "recent_search_1", bundle: ..., traitCollection: ...)`
    static func recent_search_1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "star_icon", bundle: ..., traitCollection: ...)`
    static func star_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.star_icon, compatibleWith: traitCollection)
    }
    #endif

    /// `UIImage(named: "recent_search_2", bundle: ..., traitCollection: ...)`
    static func recent_search_2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "recent_search_3", bundle: ..., traitCollection: ...)`
    static func recent_search_3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.recent_search_3, compatibleWith: traitCollection)
    }
    #endif

    /// This `R.image.bookDetail` struct is generated, and contains static references to 4 images.
    struct bookDetail {
      /// Image `back`.
      static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "BookDetail/back")
      /// Image `bookImage`.
      static let bookImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "BookDetail/bookImage")
      /// Image `pdfImage`.
      static let pdfImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "BookDetail/pdfImage")
      /// Image `star`.
      static let star = Rswift.ImageResource(bundle: R.hostingBundle, name: "BookDetail/star")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
      static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.bookDetail.back, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "bookImage", bundle: ..., traitCollection: ...)`
      static func bookImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.bookDetail.bookImage, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "pdfImage", bundle: ..., traitCollection: ...)`
      static func pdfImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.bookDetail.pdfImage, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "star", bundle: ..., traitCollection: ...)`
      static func star(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.bookDetail.star, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    /// This `R.image.home` struct is generated, and contains static references to 4 images.
    struct home {
      /// Image `Star `.
      static let star = Rswift.ImageResource(bundle: R.hostingBundle, name: "Home/Star ")
      /// Image `arrow`.
      static let arrow = Rswift.ImageResource(bundle: R.hostingBundle, name: "Home/arrow")
      /// Image `magnify`.
      static let magnify = Rswift.ImageResource(bundle: R.hostingBundle, name: "Home/magnify")
      /// Image `sample`.
      static let sample = Rswift.ImageResource(bundle: R.hostingBundle, name: "Home/sample")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "Star ", bundle: ..., traitCollection: ...)`
      static func star(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.star, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "arrow", bundle: ..., traitCollection: ...)`
      static func arrow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.arrow, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "magnify", bundle: ..., traitCollection: ...)`
      static func magnify(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.magnify, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "sample", bundle: ..., traitCollection: ...)`
      static func sample(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.home.sample, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    /// This `R.image.librarySearch` struct is generated, and contains static references to 9 images.
    struct librarySearch {
      /// Image `back`.
      static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/back")
      /// Image `bookImage1`.
      static let bookImage1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/bookImage1")
      /// Image `bookImage2`.
      static let bookImage2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/bookImage2")
      /// Image `bookImage3`.
      static let bookImage3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/bookImage3")
      /// Image `bookImage4`.
      static let bookImage4 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/bookImage4")
      /// Image `magnify`.
      static let magnify = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/magnify")
      /// Image `recent_search_1`.
      static let recent_search_1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/recent_search_1")
      /// Image `recent_search_2`.
      static let recent_search_2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/recent_search_2")
      /// Image `recent_search_3`.
      static let recent_search_3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "LibrarySearch/recent_search_3")

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
      static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.back, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "bookImage1", bundle: ..., traitCollection: ...)`
      static func bookImage1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.bookImage1, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "bookImage2", bundle: ..., traitCollection: ...)`
      static func bookImage2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.bookImage2, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "bookImage3", bundle: ..., traitCollection: ...)`
      static func bookImage3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.bookImage3, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "bookImage4", bundle: ..., traitCollection: ...)`
      static func bookImage4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.bookImage4, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "magnify", bundle: ..., traitCollection: ...)`
      static func magnify(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.magnify, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "recent_search_1", bundle: ..., traitCollection: ...)`
      static func recent_search_1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.recent_search_1, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "recent_search_2", bundle: ..., traitCollection: ...)`
      static func recent_search_2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.recent_search_2, compatibleWith: traitCollection)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// `UIImage(named: "recent_search_3", bundle: ..., traitCollection: ...)`
      static func recent_search_3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.librarySearch.recent_search_3, compatibleWith: traitCollection)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ViewController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
