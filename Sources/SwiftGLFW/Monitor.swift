//
//  Monitor.swift
//  
//
//  Created by David Green on 1/25/22.
//

import cglfw

public extension GLFW {
    class Monitor {
        fileprivate static var rawMonitorCache = Dictionary<OpaquePointer, Monitor>()
        
        internal let glfwMonitor: OpaquePointer?
        
        internal init(monitor: OpaquePointer) {
            glfwMonitor = monitor
        }
        
        
        
        fileprivate static func cachedMonitor(for glfwMonitor: OpaquePointer) -> Monitor {
            if let cachedMonitor = rawMonitorCache[glfwMonitor] {
                return cachedMonitor
            }
            let newMonitor = Monitor(monitor: glfwMonitor)
            rawMonitorCache[glfwMonitor] = newMonitor
            return newMonitor
        }
        
    }
}

// MARK: - Retrieving monitors
extension GLFW.Monitor {
    static func monitors() -> [GLFW.Monitor] {
        var monitorCount: Int32 = -1
        guard let monitorPointers = glfwGetMonitors(&monitorCount) else {
            return []
        }
        
        var monitors = [GLFW.Monitor]()
        for index in 0 ..< Int(monitorCount) {
            guard let thisMonitor = monitorPointers.advanced(by: index).pointee else {
                continue
            }
            monitors.append(cachedMonitor(for: thisMonitor))
        }
        
        return monitors
    }
    
    static func primaryMonitor() -> GLFW.Monitor? {
        guard let rawMonitor = glfwGetPrimaryMonitor() else { return nil }
        return cachedMonitor(for: rawMonitor)
    }
}
