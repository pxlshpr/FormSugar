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
    colorScheme == .light ? Color(.secondarySystemGroupedBackground) : Color(hex: "232323")
}
