import Foundation
import SwiftSoup

struct AElementBuilder: ElementBuilder {
    let tagName: String = "a"
    
    func build(
        for node: Node,
        into markdown: inout String,
        with childBuilder: (Node, inout String) throws -> Void
    ) throws {
        markdown += "["
        for child in node.getChildNodes() {
            try childBuilder(child, &markdown)
        }
        markdown += "]"
        
        let href = try node.attr("href")
        markdown += "(\(href))"
    }
}
