import Foundation

struct InvalidURLError: Error {}
struct InvalidQueryError: Error {}
struct EmptyArgumentsError: Error {}

@main
public enum Run {
    static func main() {
        do {
          try openURL(parseQueryURLFromCommandLineArguments(CommandLine.arguments))
        } catch {
            print("Failed to open URL: \(error)")
        }
    }
}

public func parseQueryStringFromCommandLineArguments(_ arguments: [String]) throws -> String {
  try arguments
    .lazy
    .dropFirst()
    .map { $0.trimmingCharacters(in: .whitespaces) }
    .filter { !$0.isEmpty }
    .nonEmpty
    .orThrow(EmptyArgumentsError())
    .joined(separator: " ")
    .replacingOccurrences(of: "-", with: "!")
    .addingPercentEncoding(withAllowedCharacters: .alphanumerics)
    .orThrow(InvalidQueryError())
    .nonEmpty
    .orThrow(InvalidQueryError())
}

public func duckDuckGoURL(withQueryString query: String) throws -> URL {
  try URL(string: "https://duckduckgo.com/")
    .orThrow(InvalidURLError())
    .appending(queryItems: [URLQueryItem(name: "q", value: query)])
}

public func parseQueryURLFromCommandLineArguments(_ arguments: [String]) throws -> URL {
  let query = try parseQueryStringFromCommandLineArguments(arguments)
  return try duckDuckGoURL(withQueryString: query)
}

private func openURL(_ url: URL) throws {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    process.arguments = [url.absoluteString]

    try process.run()
    process.waitUntilExit()
}

private extension Collection {
  var nonEmpty: Self? {
    guard !isEmpty else { return nil }
    return self
  }
}
