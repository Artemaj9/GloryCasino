//
//  Fonts.swift
//

import SwiftUI

enum CustomFont: String {
    case heavy = "Inter-Heavy"
    case black = "Inter-Black"
    case extraBold = "Inter-ExtraBold"
    case bold = "Inter-Bold"
    case semiBold = "Inter-SemiBold"
    case medium = "Inter-Medium"
    case regular = "unicode.revueb"
  //  case revue = "unicode.revueb"
    case kotto = "KottoSlab-Bold"
    
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> Font {
        Font.custom(font.rawValue, size: size)
    }
}
