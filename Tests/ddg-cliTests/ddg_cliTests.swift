import XCTest
@testable import ddg_cli

final class ddg_cliTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ddg_cli().text, "Hello, World!")
    }
}
