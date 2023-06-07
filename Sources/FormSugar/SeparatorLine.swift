import SwiftUI
import ColorSugar

public struct SeparatorLine: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        Color(hex: colorScheme == .light ? "B3B3B6" : "424242")
            .frame(height: 0.18)
    }
}
