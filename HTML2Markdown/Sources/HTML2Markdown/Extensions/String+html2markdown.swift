import Foundation

public extension String {
    var html2markdown: String {
        get throws {
            let markdown = try HTML2Markdown(html: self).markdown()
            return markdown
        }
    }
}
