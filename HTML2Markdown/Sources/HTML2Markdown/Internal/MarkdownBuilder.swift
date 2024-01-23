import Foundation
import SwiftSoup

struct MarkdownBuilder {
    private let document: Document
    private let builders: [ElementBuilder]
    
    init(
        document: Document,
        builders: [ElementBuilder]
    ) {
        self.document = document
        self.builders = builders
    }
    
    @inlinable
    func build() throws -> String {
        guard let body: Node = document.body() else {
            throw EmptyBodyError()
        }
        
        var markdown: String = ""
        
        try build(for: body, into: &markdown)
        
        for node in body.getChildNodes() {
            try build(for: node, into: &markdown)
        }
        
        return markdown
    }
    
    @inline(__always)
    private func build(
        for node: Node,
        into markdown: inout String
    ) throws {
        for builder in builders {
            guard node.nodeName() == builder.tagName else {
                continue
            }
            
            try builder.build(
                for: node,
                into: &markdown,
                with: build(for:into:)
            )
        }
        
        // Handling text between tags
        guard node.nodeName() == "#text" else {
            return
        }
        
        markdown += node.description.trimmingCharacters(in: .newlines)
    }
}

// MARK: - EmptyBodyError

extension MarkdownBuilder {
    struct EmptyBodyError: Error {}
}
