import SwiftUI
import ColorSugar

public struct ListBackground: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        listBackgroundColor(colorScheme: colorScheme)
    }
}

public func listBackgroundColor(colorScheme: ColorScheme) -> Color {
    var lightColor: Color {
#if os(iOS)
        Color(.systemGroupedBackground)
#else
        Color(.windowBackgroundColor)
#endif
    }

    return colorScheme == .light ? lightColor : Color(hex: "191919")
}
