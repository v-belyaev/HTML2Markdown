import Foundation
import SwiftSoup

protocol ElementBuilder {
    var tagName: String { get }
    
    @inlinable
    func build(
        for node: Node,
        into markdown: inout String,
        with childBuilder: (Node, inout String) throws -> Void
    ) throws
}
