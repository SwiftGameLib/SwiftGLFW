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

    func testGetError() {
        var error = GLFWGetError()
        XCTAssertNil(error)

        glfwInitHint(255, 255)
        error = GLFWGetError()
        XCTAssertNotNil(error)
        XCTAssertNotEqual(error!.errorCode, Int(GLFW_NO_ERROR))
        XCTAssertNotNil(error!.errorDescription)
    }

    func testErrorCallback() {
        let expectation = self.expectation(description: "Error occurred")
        GLFWSetErrorCallback { (errorCode, errorDescription) in
            XCTAssertNotNil(errorDescription)
            print("Got expected error: \(errorDescription!)")
            // Clear the error message
            GLFWGetError()
            if errorCode != 0 {
                expectation.fulfill()
            }
        }
        glfwInitHint(255, 255)
        waitForExpectations(timeout: 1, handler: nil)
        GLFWSetErrorCallback(callback: nil)
    }

    static var allTests = [
        ("testInitializationAndTermination", testInitializationAndTermination),
        ("testVersion", testVersion),
        ("testGetError", testGetError),
        ("testErrorCallback", testErrorCallback),
    ]
}
