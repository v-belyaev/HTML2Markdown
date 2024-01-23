import Foundation
import SwiftSoup

struct EmElementBuilder: ElementBuilder {
    let tagName: String = "em"
    
    func build(
        for node: Node,
        into markdown: inout String,
        with childBuilder: (Node, inout String) throws -> Void
    ) throws {
        markdown += "*"
        for child in node.getChildNodes() {
            try childBuilder(child, &markdown)
        }
        markdown += "*"
    }
}
