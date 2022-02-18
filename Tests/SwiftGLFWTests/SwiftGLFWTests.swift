import XCTest
import SwiftGLFW

final class SwiftGLFWTests: XCTestCase {
    func testInitializationAndTermination() {
        GLFW.initHint(.JoystickHat(exposeAsButtons: true))
        XCTAssertTrue(GLFW.initialize())
        GLFW.terminate()
    }

    func testVersion() {
        let (major, minor, revision) = GLFW.version
        let versionString = GLFW.versionString
        XCTAssert(versionString!.starts(with: "\(major).\(minor).\(revision)"))
    }

    func testGetError() {
        var error = GLFW.error()
        XCTAssertNil(error)

        glfwInitHint(255, 255)
        error = GLFW.error()
        XCTAssertNotNil(error)
        XCTAssertNotEqual(error!.errorCode, Int(GLFW_NO_ERROR))
        XCTAssertNotNil(error!.errorDescription)
    }

    func testErrorCallback() {
        let expectation = self.expectation(description: "Error occurred")
        GLFW.setErrorCallback { (errorCode, errorDescription) in
            XCTAssertNotNil(errorDescription)
            print("Got expected error: \(errorDescription!)")
            // Clear the error message
            GLFW.error()
            if errorCode != 0 {
                expectation.fulfill()
            }
        }
        glfwInitHint(255, 255)
        waitForExpectations(timeout: 1, handler: nil)
        GLFW.setErrorCallback(callback: nil)
    }

    static var allTests = [
        ("testInitializationAndTermination", testInitializationAndTermination),
        ("testVersion", testVersion),
        ("testGetError", testGetError),
        ("testErrorCallback", testErrorCallback),
    ]
}
