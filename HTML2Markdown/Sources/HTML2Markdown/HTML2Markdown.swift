import Foundation
import SwiftSoup

public struct HTML2Markdown {
    private let html: String
    
    /// Add new `ElementBuilder` right here
    /// The order is not important
    private let builders: [ElementBuilder] = [
        BElementBuilder(),
        StrongElementBuilder(),
        IElementBuilder(),
        EmElementBuilder(),
        AElementBuilder(),
        BrElementBuilder()
    ]
    
    public init(html: String) {
        self.html = html
    }
    
    public func markdown() throws -> String {
        let document = try SwiftSoup.parse(html)
        
        let builder = MarkdownBuilder(
            document: document,
            builders: builders
        )
        
        let markdown = try builder.build()
        return markdown
    }
}
