import XCTest
@testable import SwiftGLFW

final class SwiftGLFWTests: XCTestCase {
    func testInitializationAndTermination() {
        GLFWInitHint(.JoystickHatButtons(true))
        XCTAssertTrue(GLFWInit())
        GLFWTerminate()
    }

    static var allTests = [
        ("testInitializationAndTermination", testInitializationAndTermination),
    ]
}
