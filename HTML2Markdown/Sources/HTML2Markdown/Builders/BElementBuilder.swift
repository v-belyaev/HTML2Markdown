import Foundation
import SwiftSoup

struct BElementBuilder: ElementBuilder {
    let tagName: String = "b"
    
    func build(
        for node: Node,
        into markdown: inout String,
        with childBuilder: (Node, inout String) throws -> Void
    ) throws {
        markdown += "**"
        for child in node.getChildNodes() {
            try childBuilder(child, &markdown)
        }
        markdown += "**"
    }
}
