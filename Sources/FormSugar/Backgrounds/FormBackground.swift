import SwiftUI
import ColorSugar

public struct FormBackground: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        formBackgroundColor(colorScheme: colorScheme)
    }
}

public func formBackgroundColor(colorScheme: ColorScheme) -> Color {
    var lightColor: Color {
#if os(iOS)
        Color(.systemGroupedBackground)
#else
        Color(.windowBackgroundColor)
#endif
    }

    return colorScheme == .dark ? Color(hex: "1C1C1E") : lightColor
}
