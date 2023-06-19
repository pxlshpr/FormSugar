import SwiftUI

public struct FormCellBackground: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        formCellBackgroundColor(colorScheme: colorScheme)
    }
}

public func formCellBackgroundColor(colorScheme: ColorScheme) -> Color {
    
    var lightColor: Color {
#if os(iOS)
        Color(.secondarySystemGroupedBackground)
#else
        Color(.controlBackgroundColor)
#endif
    }
    
    return colorScheme == .light ? lightColor : Color(hex: "2C2C2E")
}
