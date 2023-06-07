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
    colorScheme == .dark ? Color(hex: "1C1C1E") : Color(.systemGroupedBackground)
}
