import SwiftUI

public struct FormCellBackground: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        formCellBackgroundColor(colorScheme: colorScheme)
    }
}

public func formCellBackgroundColor(colorScheme: ColorScheme) -> Color {
    colorScheme == .light ? Color(.secondarySystemGroupedBackground) : Color(hex: "2C2C2E")
}
