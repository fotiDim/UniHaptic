import XCTest
@testable import UniHaptics

final class UniHapticsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UniHaptics().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
