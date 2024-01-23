import Foundation
import SwiftSoup

struct BrElementBuilder: ElementBuilder {
    let tagName: String = "br"
    
    func build(
        for node: Node,
        into markdown: inout String,
        with childBuilder: (Node, inout String) throws -> Void
    ) throws {
        guard !markdown.isEmpty else {
            return
        }
        
        markdown += "\n"
    }
}
