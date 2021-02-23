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
public func GLFWGetError() -> (errorCode: Int, errorDescription: String?)? {
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
