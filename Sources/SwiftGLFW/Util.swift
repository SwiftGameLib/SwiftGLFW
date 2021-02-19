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

    var glfwInt: Int32 {
        return self ? GLFW_TRUE : GLFW_FALSE
    }
}


