//
//  Initialization.swift
//
//
//  Created by David Green on 2/18/21.
//

import cglfw

// MARK: - Initialization and termination

/// Initializes the GLFW library.
///
/// - Returns: `True` if initialization was successful, `False` if an error occurred.
/// - SeeAlso:`GLFWTerminate()`
/// - Note: The corresponding C function is [glfwInit](https://www.glfw.org/docs/latest/group__init.html#ga317aac130a235ab08c6db0834907d85e).
public func GLFWInit() -> Bool {
    let result = glfwInit()
    return Bool(result)
}

/// Destroys all remaining windows and cursors, restores any modified gamma ramps and frees any other allocated resources.
///
///- SeeAlso: `GLFWInit()`
///- Note: The corresponding C function is [glfwTerminate](https://www.glfw.org/docs/latest/group__init.html#gaaae48c0a18607ea4a4ba951d939f0901).
public func GLFWTerminate() {
    glfwTerminate()
}

/// Init hints are set before calling `GLFWInit` and affect how the library behaves until termination.
/// - SeeAlso: `GLFWInitHint()`
/// - Note: The corresponding C enums are [Initialization hints](https://www.glfw.org/docs/latest/intro_guide.html#init_hints).
public enum InitHint {
    case JoystickHat(exposeAsButtons:Bool)
    #if os(macOS)
    case CocoaCurrentDirectory(setToResources: Bool)
    case CocoaMenubar(createBasic: Bool)
    #endif

    internal func glfwHintAndValue() -> (Int32, Int32) {
        switch self {
        case .JoystickHat(let value):
            return (GLFW_JOYSTICK_HAT_BUTTONS, value.glfwInt)
        case .CocoaCurrentDirectory(let value):
            return (GLFW_COCOA_CHDIR_RESOURCES, value.glfwInt)
        case .CocoaMenubar(let value):
            return (GLFW_COCOA_MENUBAR, value.glfwInt)
        }
    }
}

/// Sets hints for the next initialization of GLFW.
/// - Parameter hint: The init hint to set, configured with the value to set.
/// - Note: The corresponding C function is [glfwInitHint](https://www.glfw.org/docs/latest/group__init.html#ga110fd1d3f0412822b4f1908c026f724a).
public func GLFWInitHint(_ hint: InitHint) {
    let (hintEnum, hintValue) = hint.glfwHintAndValue()
    glfwInitHint(hintEnum, hintValue)
}
