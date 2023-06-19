import SwiftUI
import ColorSugar

public struct ListCellBackground: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        listCellBackgroundColor(colorScheme: colorScheme)
    }
}

public func listCellBackgroundColor(colorScheme: ColorScheme) -> Color {
    var lightColor: Color {
#if os(iOS)
        Color(.secondarySystemGroupedBackground)
#else
        Color(.controlBackgroundColor)
#endif
    }

    return colorScheme == .light ? lightColor : Color(hex: "232323")
}
