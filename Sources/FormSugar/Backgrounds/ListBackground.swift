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
    colorScheme == .light ? Color(.systemGroupedBackground) : Color(hex: "191919")
}
