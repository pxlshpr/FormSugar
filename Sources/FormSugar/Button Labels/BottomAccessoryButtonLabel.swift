import SwiftUI

public func bottomAccessoryButtonLabel(_ systemImage: String, material: Material = .ultraThinMaterial) -> some View {
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

public func bottomAccessoryButtonLabel(text: String, material: Material = .ultraThinMaterial) -> some View {
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

