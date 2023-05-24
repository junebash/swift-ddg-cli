import Foundation

struct InvalidURLError: Error {}
struct InvalidQueryError: Error {}

@main
public enum Run {
    static func main() {
        let searchQuery = CommandLine.arguments
            .dropFirst()
            .joined(separator: " ")
            .replacingOccurrences(of: "-", with: "!")
        do {
            guard !searchQuery.isEmpty else {
                throw InvalidQueryError()
            }
            try searchDuckDuckGo(query: searchQuery)
        } catch {
            print("Failed to open URL: \(error)")
        }
    }
}

private func openURL(_ url: URL) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    process.arguments = [url.absoluteString]

    try process.run()
    process.waitUntilExit()
}

private func searchDuckDuckGo(query: String) throws {
    let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
    let urlString = "https://duckduckgo.com/?q=\(queryEncoded)"

    if let url = URL(string: urlString) {
        try openURL(url)
    } else {
        throw InvalidURLError()
    }
}
