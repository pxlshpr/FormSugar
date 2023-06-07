import SwiftUI

public struct DismissButtonLabel: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let forKeyboard: Bool
    public init(forKeyboard: Bool = false) {
        self.forKeyboard = forKeyboard
    }
    
    @ViewBuilder
    public var body: some View {
        if forKeyboard {
            keyboardButton
        } else {
            dismissButton
        }
    }
    
    var dismissButton_legacy: some View {
        Image(systemName: "chevron.down")
            .imageScale(.medium)
            .fontWeight(.medium)
//            .foregroundStyle(.thinMaterial)
            .foregroundColor(.white)
            .frame(width: 38, height: 38)
            .background(
                Circle()
                    .foregroundColor(.accentColor)
                    .foregroundStyle(.thinMaterial)
                    .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 3)
            )
    }
    
    var dismissButton: some View {
        bottomAccessoryButtonLabel("chevron.down")
    }
    
    var keyboardButton: some View {
        bottomAccessoryButtonLabel("keyboard.chevron.compact.down")
    }
}

func bottomAccessoryButtonLabel(_ systemImage: String, material: Material = .ultraThinMaterial) -> some View {
    Image(systemName: systemImage)
        .imageScale(.medium)
        .fontWeight(.medium)
        .foregroundColor(Color(.secondaryLabel))
        .frame(width: 38, height: 38)
        .background(
            Circle()
                .foregroundStyle(material)
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 3)
        )
}

func bottomAccessoryButtonLabel(text: String, material: Material = .ultraThinMaterial) -> some View {
    Text(text)
        .textCase(.uppercase)
        .font(.system(size: 14, weight: .semibold, design: .rounded))
        .foregroundColor(Color(.secondaryLabel))
        .frame(height: 38)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 19, style: .continuous)
                .foregroundStyle(material)
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 3)
        )
}

