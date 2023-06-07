import SwiftUI

public struct K {
    public struct FormStyledSection {
        public static let horizontalPadding: CGFloat = 17
        public static let verticalPadding: CGFloat = 15
        public static let horizontalOuterPadding: CGFloat = 20
        public static let verticalOuterPadding: CGFloat = 10
    }
    
    public struct FormStyledScrollView {
        public static let verticalSpacing: CGFloat = 8
    }
}

public struct FormStyledSection<Header: View, Footer: View, Content: View>: View {

    public enum BackgroundStyle {
        case standard
        case light
        case material(Material)
        case clear
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var header: Header?
    var footer: Footer?
    var content: () -> Content
    var customVerticalPadding: CGFloat?
    var customHorizontalPadding: CGFloat?
    var customVerticalOuterPadding: CGFloat?
    var customHorizontalOuterPadding: CGFloat?
    
//    let usesLightBackground: Bool
    let backgroundStyle: BackgroundStyle
    let largeHeading: Bool
    
    public init(
        header: Header,
        footer: Footer,
        backgroundStyle: BackgroundStyle = .standard,
//        usesLightBackground: Bool = false,
        largeHeading: Bool = false,
        horizontalPadding: CGFloat? = nil,
        verticalPadding: CGFloat? = nil,
        horizontalOuterPadding: CGFloat? = nil,
        verticalOuterPadding: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.header = header
        self.footer = footer
        self.largeHeading = largeHeading
        self.backgroundStyle = backgroundStyle
//        self.usesLightBackground = usesLightBackground
        self.customVerticalPadding = verticalPadding
        self.customHorizontalPadding = horizontalPadding
        self.customHorizontalOuterPadding = horizontalOuterPadding
        self.customVerticalOuterPadding = verticalOuterPadding
        self.content = content
    }

    public var body: some View {
        if let header {
            if let footer {
                withHeader(header, andFooter: footer)
            } else {
                withHeaderOnly(header)
            }
        } else {
            if let footer {
                withFooterOnly(footer)
            } else {
                withoutHeaderOrFooter
            }
        }
    }

    func withHeader(_ header: Header, andFooter footer: Footer) -> some View {
        VStack(spacing: 7) {
            headerView(for: header)
            contentView
            footerView(for: footer)
                .padding(.bottom, verticalPadding)
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, verticalPadding)
    }
    
    func withFooterOnly(_ footer: Footer) -> some View {
        VStack(spacing: 7) {
            contentView
            footerView(for: footer)
                .padding(.bottom, verticalPadding)
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, verticalPadding)
    }
    
    func withHeaderOnly(_ header: Header) -> some View {
        VStack(spacing: 7) {
            headerView(for: header)
            contentView
                .padding(.bottom, verticalPadding)
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, verticalPadding)
    }

    var withoutHeaderOrFooter: some View {
        contentView
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
    }
    
    //MARK: - Components
    
    func footerView(for footer: Footer) -> some View {
        footer
            .fixedSize(horizontal: false, vertical: true)
            .foregroundColor(Color(.secondaryLabel))
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, horizontalPadding)
    }
    
    func headerView(for header: Header) -> some View {
        Group {
            if largeHeading {
                header
                    .foregroundColor(.primary)
                    .font(.title2)
                    .bold()
            } else {
                header
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.footnote)
                    .textCase(.uppercase)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, horizontalPadding)
    }
    
    var horizontalPadding: CGFloat {
        customHorizontalOuterPadding ?? K.FormStyledSection.horizontalOuterPadding
    }
    
    var verticalPadding: CGFloat {
        customVerticalOuterPadding ?? K.FormStyledSection.verticalOuterPadding
    }
    
//    var backgroundColor: Color {
//        Color(.secondarySystemGroupedBackground)
//        colorScheme == .light ? Color(.secondarySystemGroupedBackground) : Color(hex: "2C2C2E")
//    }
    
    var background: some View {
        
        var shape: some Shape {
            RoundedRectangle(cornerRadius: 10)
        }
        
        return Group {
            switch backgroundStyle {
            case .standard:
                shape
                    .fill(formCellBackgroundColor(colorScheme: colorScheme))
            case .light:
                if colorScheme == .light {
                    shape
                        .fill(Color(.secondarySystemGroupedBackground))
                } else {
                    shape
                        .fill(Color(hex: "232323"))
                }
            case .material(let material):
                shape
                    .fill(material)
            case .clear:
                Color.clear
            }
        }
    }
     
    var contentView: some View {
        content()
//            .background(.green)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, customHorizontalPadding ?? K.FormStyledSection.horizontalPadding)
            .padding(.vertical, customVerticalPadding ?? K.FormStyledSection.verticalPadding)
            .background(
                background
//                RoundedRectangle(cornerRadius: 10)
//                    .foregroundColor(backgroundColor)
            )
    }
}

/// Support optional header
extension FormStyledSection where Header == EmptyView {
    public init(
        footer: Footer,
        backgroundStyle: BackgroundStyle = .standard,
//        usesLightBackground: Bool = false,
        largeHeading: Bool = false,
        horizontalPadding: CGFloat? = nil,
        verticalPadding: CGFloat? = nil,
        horizontalOuterPadding: CGFloat? = nil,
        verticalOuterPadding: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.header = nil
        self.footer = footer
        self.largeHeading = largeHeading
        self.backgroundStyle = backgroundStyle
//        self.usesLightBackground = usesLightBackground
        self.customVerticalPadding = verticalPadding
        self.customHorizontalPadding = horizontalPadding
        self.customHorizontalOuterPadding = horizontalOuterPadding
        self.customVerticalOuterPadding = verticalOuterPadding
        self.content = content
    }
}

/// Support optional footer
extension FormStyledSection where Footer == EmptyView {
    public init(
        header: Header,
        backgroundStyle: BackgroundStyle = .standard,
//        usesLightBackground: Bool = false,
        largeHeading: Bool = false,
        horizontalPadding: CGFloat? = nil,
        verticalPadding: CGFloat? = nil,
        horizontalOuterPadding: CGFloat? = nil,
        verticalOuterPadding: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.header = header
        self.footer = nil
        self.largeHeading = largeHeading
        self.backgroundStyle = backgroundStyle
//        self.usesLightBackground = usesLightBackground
        self.customVerticalPadding = verticalPadding
        self.customHorizontalPadding = horizontalPadding
        self.customHorizontalOuterPadding = horizontalOuterPadding
        self.customVerticalOuterPadding = verticalOuterPadding
        self.content = content
    }
}


/// Support optional header and footer
extension FormStyledSection where Header == EmptyView, Footer == EmptyView {
    public init(
        backgroundStyle: BackgroundStyle = .standard,
//        usesLightBackground: Bool = false,
        largeHeading: Bool = false,
        horizontalPadding: CGFloat? = nil,
        verticalPadding: CGFloat? = nil,
        horizontalOuterPadding: CGFloat? = nil,
        verticalOuterPadding: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.header = nil
        self.footer = nil
        self.backgroundStyle = backgroundStyle
//        self.usesLightBackground = usesLightBackground
        self.largeHeading = largeHeading
        self.customVerticalPadding = verticalPadding
        self.customHorizontalPadding = horizontalPadding
        self.customHorizontalOuterPadding = horizontalOuterPadding
        self.customVerticalOuterPadding = verticalOuterPadding
        self.content = content
    }
}
