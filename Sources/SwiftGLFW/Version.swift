//
//  Version.swift
//  
//
//  Created by David Green on 2/22/21.
//

import cglfw

public extension GLFW {
    /// Retrieves the major, minor, and revision numbers of the GLFW library.
    /// - Returns: ('major', 'minor', 'revision') version number components.
    /// - Note: The corresponding C function is [glfwGetVersion](https://www.glfw.org/docs/latest/group__init.html#ga9f8ffaacf3c269cc48eafbf8b9b71197).
    static var version: (major: Int, minor: Int, revision:  Int) {
        var major: Int32 = 0, minor: Int32 = 0, rev: Int32 = 0
        glfwGetVersion(&major, &minor, &rev)
        return (Int(major), Int(minor), Int(rev))
    }
    
    /// Returns the compile-time generated version string of the GLFW library.
    /// - Returns: The GLFW version string,
    /// - Note: The corresponding C function is [glfwGetVersionString](https://www.glfw.org/docs/latest/group__init.html#ga23d47dc013fce2bf58036da66079a657).
    static var versionString: String? {
        guard let version = glfwGetVersionString() else { return nil }
        let versionString = String(cString: version)
        return versionString
    }
}
