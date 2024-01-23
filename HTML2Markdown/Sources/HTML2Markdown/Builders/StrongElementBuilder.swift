import Foundation
import SwiftSoup

struct StrongElementBuilder: ElementBuilder {
    let tagName: String = "strong"
    
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
