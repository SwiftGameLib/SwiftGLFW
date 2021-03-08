//
//  Error.swift
//  
//
//  Created by David Green on 2/23/21.
//

import cglfw

/// Returns and clears the error code of the last error that occured on the calling thread.
/// - Returns:The error code and description of the last error for the calling thread, or `nil` if no error has occurred.
/// - Note: The corresponding C function is [glfwGetError](https://www.glfw.org/docs/latest/group__init.html#ga944986b4ec0b928d488141f92982aa18)
@discardableResult public func GLFWGetError() -> (errorCode: Int, errorDescription: String?)? {
    var description = UnsafePointer<Int8>(bitPattern: 0)
    let errorCode = glfwGetError(&description)
    if errorCode == GLFW_NO_ERROR  {
        return nil
    }
    let error = Int(errorCode)
    guard let errorDescription = description else { return (error, nil) }
    let descriptionString = String(cString: errorDescription)
    return (error, descriptionString)
}

/// The type for error callback functions.
/// - Note: The corresponding C type is [GLFWerrorfun](https://www.glfw.org/docs/latest/group__init.html#ga6b8a2639706d5c409fc1287e8f55e928)
public typealias GLFWErrorFunc = (_ errorCode: Int, _ errorDescription: String?) -> Void

// This is used internally to store the Swift callback so we can trampoline to it from the C callback.
private var errorCallback: GLFWErrorFunc? = nil

/// Sets the error callback that will be called with an error code and human-readable description each time a GLFW error occurs.
/// - Parameter callback: The new callback, or `nil` to remove the currently set callback.
/// - Returns: The previously set callback, or `nil` if no callback was set.
/// - Note: The corresponding C function is [glfwSetErrorCallback](https://www.glfw.org/docs/latest/group__init.html#gaff45816610d53f0b83656092a4034f40)
@discardableResult public func GLFWSetErrorCallback(callback: GLFWErrorFunc?) -> GLFWErrorFunc? {
    let previousCallback = errorCallback
    errorCallback = callback

    if errorCallback == nil {
        glfwSetErrorCallback(nil)
    } else {
        glfwSetErrorCallback { (errorCode, errorDescription) in
            errorCallback!(Int(errorCode), errorDescription != nil ? String(cString: errorDescription!) : nil)
        }
    }

    return previousCallback
}
