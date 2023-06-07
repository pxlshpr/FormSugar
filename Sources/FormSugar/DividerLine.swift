import SwiftUI
import ColorSugar

public struct DividerLine: View {
    @Environment(\.colorScheme) var colorScheme
    public init() { }
    public var body: some View {
        Color(hex: colorScheme == .light ? "D6D6D7" : "3A3A3A")
            .frame(height: 0.18)
    }
}
