import XCTest
@testable import SwiftGLFW

final class SwiftGLFWTests: XCTestCase {
    func testInitializationAndTermination() {
        GLFWInitHint(.JoystickHatButtons(true))
        XCTAssertTrue(GLFWInit())
        GLFWTerminate()
    }

    func testVersion() {
        let (major, minor, revision) = GLFWGetVersion()
        let versionString = GLFWGetVersionString()
        XCTAssert(versionString!.starts(with: "\(major).\(minor).\(revision)"))
    }

    static var allTests = [
        ("testInitializationAndTermination", testInitializationAndTermination),
        ("testVersion", testVersion),
    ]
}
