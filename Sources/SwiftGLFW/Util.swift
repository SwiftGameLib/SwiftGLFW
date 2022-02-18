//
//  Util.swift
//  
//
//  Created by David Green on 2/18/21.
//

import Foundation
import cglfw

extension Bool {
    init(_ glfwBool: Int32) {
        self = glfwBool == GLFW_TRUE
    }
}

protocol GLFWValueProviding {
    var glfwValue: Int32 { get }
}

extension Optional: GLFWValueProviding where Wrapped == Int {
    var glfwValue: Int32 {
        return self != nil ? Int32(self!) : GLFW_DONT_CARE
    }
}
extension Int: GLFWValueProviding {
    var glfwValue: Int32 {
        return Int32(self)
    }
}

extension Bool: GLFWValueProviding {
    var glfwValue: Int32 {
        return self  ? GLFW_TRUE : GLFW_FALSE
    }
}


