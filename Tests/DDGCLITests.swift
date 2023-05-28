import ddg
import XCTest

extension URL {
  static func ddgURL(withQueryString queryString: String) throws -> URL {
    try URL(string: "https://duckduckgo.com/?q=\(queryString)").orThrow()
  }
}

final class DDGCLITests: XCTestCase {
  func testParseQuery() throws {
    try XCTAssertEqual(
      parseQueryStringFromCommandLineArguments("ddg youse's butts".intoCommandLineArguments()),
      "youse%27s%20butts"
    )
    try XCTAssertEqual(
      parseQueryStringFromCommandLineArguments("ddg youse's butts -g".intoCommandLineArguments()),
      "youse%27s%20butts%20%21g"
    )
    XCTAssertThrowsError(
      try parseQueryStringFromCommandLineArguments(["ddg", ""])
    )
  }
}

extension String {
  func intoCommandLineArguments() -> [String] {
    self.split(separator: " ").map(String.init)
  }
}
