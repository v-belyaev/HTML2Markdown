import SwiftUI
import HTML2Markdown

private let markdown: String? = {
    let html = """
    <!--This is a comment. Comments are not displayed in the browser-->
    <a id=\"123\" href=\"https://google.com\">Link</a>
    <br/><b>Bold</b> text <br/><i>Italic</i> text <br/>
    <style> body { text-color: #ffffff; }</style>
    <script>alert(\"Hello, World!\");</script>
    """
    return try? html.html2markdown
}()

struct ContentView: View {
    var body: some View {
        VStack {
            if let markdown {
                Text(.init(markdown))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
