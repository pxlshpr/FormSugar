import SwiftUI

public func bottomAccessoryButtonLabel(_ systemImage: String, material: Material = .ultraThinMaterial) -> some View {
    
    var color: Color {
#if os(iOS)
        Color(.secondaryLabel)
#else
        Color(.secondaryLabelColor)
#endif
    }
    
    return Image(systemName: systemImage)
        .imageScale(.medium)
        .fontWeight(.medium)
        .foregroundColor(color)
        .frame(width: 38, height: 38)
        .background(
            Circle()
                .foregroundStyle(material)
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 3)
        )
}

public func bottomAccessoryButtonLabel(text: String, material: Material = .ultraThinMaterial) -> some View {
    
    var color: Color {
#if os(iOS)
        Color(.secondaryLabel)
#else
        Color(.secondaryLabelColor)
#endif
    }
    
    return Text(text)
        .textCase(.uppercase)
        .font(.system(size: 14, weight: .semibold, design: .rounded))
        .foregroundColor(color)
        .frame(height: 38)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 19, style: .continuous)
                .foregroundStyle(material)
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 0, y: 3)
        )
}

