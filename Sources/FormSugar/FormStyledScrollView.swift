import SwiftUI

public struct FormStyledScrollView<Content: View>: View {
    
    var content: () -> Content
    let showsIndicators: Bool
    let isLazy: Bool
    let customVerticalSpacing: CGFloat?

    public init(showsIndicators: Bool = false, isLazy: Bool = true, customVerticalSpacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.isLazy = isLazy
        self.showsIndicators = showsIndicators
        self.customVerticalSpacing = customVerticalSpacing
    }
    
    public var body: some View {
        var spacing: CGFloat {
            customVerticalSpacing ?? K.FormStyledScrollView.verticalSpacing
        }
        
        var vStack: some View {
            VStack(spacing: spacing) {
                content()
                    .frame(maxWidth: .infinity)
            }
        }
        
        var lazyVStack: some View {
            LazyVStack(spacing: spacing) {
                content()
                    .frame(maxWidth: .infinity)
            }
        }
        return ScrollView(showsIndicators: showsIndicators) {
            if isLazy {
                lazyVStack
            } else {
                vStack
            }
        }
        .background(
            FormBackground()
                .edgesIgnoringSafeArea(.all) /// requireds to cover the area that would be covered by the keyboard during its dismissal animation
        )
    }
}
