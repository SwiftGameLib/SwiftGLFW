//
//  Joystick.swift
//  
//
//  Created by David Green on 2/18/22.
//

import Foundation
import cglfw

public extension GLFW {
    enum JoystickID: Int32 {
        case joystick1  = 0
        case joystick2  = 1
        case joystick3  = 2
        case joystick4  = 3
        case joystick5  = 4
        case joystick6  = 5
        case joystick7  = 6
        case joystick8  = 7
        case joystick9  = 8
        case joystick10 = 9
        case joystick11 = 10
        case joystick12 = 11
        case joystick13 = 12
        case joystick14 = 13
        case joystick15 = 14
        case joystick16 = 15
        
        public static let lastJoystick: JoystickID = .joystick16
    }
    
    static func joystickPresent(_ stickID: JoystickID) -> Bool {
        return glfwJoystickPresent(stickID.rawValue) == GLFW_TRUE
    }
    
    static func getJoystickName(_ stickID: JoystickID) -> String {
        guard let rawName = glfwGetJoystickName(stickID.rawValue) else {
            return ""
        }
        let name = String(cString: rawName)
        return name
    }
    
    static func getJoystickAxes(_ stickID: JoystickID) -> [Float] {
        var axesCount: Int32 = 0
        guard let axes = glfwGetJoystickAxes(stickID.rawValue, &axesCount) else {
            return []
        }
        var axesArray = [Float]()
        for i in 0 ..< Int(axesCount) {
            let axesValue = axes.advanced(by: i).pointee
            axesArray.append(axesValue)
        }
        return axesArray
    }
    
    static func getJoystickButtons(_ stickID: JoystickID) -> [Bool] {
        var buttonCount: Int32 = 0
        guard let buttons = glfwGetJoystickButtons(stickID.rawValue, &buttonCount) else {
            return []
        }
        var buttonArray = [Bool]()
        for i in 0 ..< Int(buttonCount) {
            let buttonValue = buttons.advanced(by: i).pointee
            buttonArray.append(buttonValue != 0)
        }
        return buttonArray
    }
}
