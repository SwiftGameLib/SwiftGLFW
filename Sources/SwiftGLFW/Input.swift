//
//  Input.swift
//  
//
//  Created by David Green on 1/26/22.
//

import Foundation
import cglfw

public extension GLFW {
    enum KeyState {
        case pressed
        case released
        case repeating
        case unknown
    }
    
    struct KeyModifiers: OptionSet {
        public let rawValue: Int32
        
        public init(rawValue: Int32) {
            self.rawValue = rawValue
        }
        
        public static let shiftKey = KeyModifiers(rawValue: 1 << 0)
        public static let controlKey = KeyModifiers(rawValue: 1 << 1)
        public static let altKey = KeyModifiers(rawValue: 1 << 2)
        public static let superKey = KeyModifiers(rawValue: 1 << 3)
        public static let capsLockKey = KeyModifiers(rawValue: 1 << 4)
        public static let numLockKey = KeyModifiers(rawValue: 1 << 5)
        
    }
    
    enum Key: Int32 {
        case unknown = -1
        case space = 32
        case apostrophe = 39
        case comma = 44
        case minus = 45
        case period = 46
        case slash = 47
        case numRow0 = 48
        case numRow1 = 49
        case numRow2 = 50
        case numRow3 = 51
        case numRow4 = 52
        case numRow5 = 53
        case numRow6 = 54
        case numRow7 = 55
        case numRow8 = 56
        case numRow9 = 57
        case semicolon = 59
        case equal = 61
        case a = 65
        case b = 66
        case c = 67
        case d = 68
        case e = 69
        case f = 70
        case g = 71
        case h = 72
        case i = 73
        case j = 74
        case k = 75
        case l = 76
        case m = 77
        case n = 78
        case o = 79
        case p = 80
        case q = 81
        case r = 82
        case s = 83
        case t = 84
        case u = 85
        case v = 86
        case w = 87
        case x = 88
        case y = 89
        case z = 90
        case leftBracket = 91 // [
        case backslash = 92 // \
        case rightBracket = 93 // ]
        case graveAccent = 96 // `
        case world1 = 161 // non-US #1
        case world2 = 162 // non-US #2
        case escape = 256
        case enter = 257
        case tab = 258
        case backspace = 259
        case insert = 260
        case delete = 261
        case right = 262
        case left = 263
        case down = 264
        case up = 265
        case pageUp = 266
        case pageDown = 267
        case home = 268
        case end = 269
        case capsLock = 280
        case scrollLock = 281
        case numLock = 282
        case printScreen = 283
        case pause = 284
        case F1 = 290
        case F2 = 291
        case F3 = 292
        case F4 = 293
        case F5 = 294
        case F6 = 295
        case F7 = 296
        case F8 = 297
        case F9 = 298
        case F10 = 299
        case F11 = 300
        case F12 = 301
        case F13 = 302
        case F14 = 303
        case F15 = 304
        case F16 = 305
        case F17 = 306
        case F18 = 307
        case F19 = 308
        case F20 = 309
        case F21 = 310
        case F22 = 311
        case F23 = 312
        case F24 = 313
        case F25 = 314
        case numpad0 = 320
        case numpad1 = 321
        case numpad2 = 322
        case numpad3 = 323
        case numpad4 = 324
        case numpad5 = 325
        case numpad6 = 326
        case numpad7 = 327
        case numpad8 = 328
        case numpad9 = 329
        case numpadDecimal = 330
        case numpadDivide = 331
        case numpadMultiply = 332
        case numpadSubtract = 333
        case numpadAdd = 334
        case numpadEnter = 335
        case numpadEqual = 336
        case leftShift = 340
        case leftControl = 341
        case leftAlt = 342
        case leftSuper = 343
        case rightShift = 344
        case rightControl = 345
        case rightAlt = 346
        case rightSuper = 347
        case menu = 348
        
        static let last = Self.menu
        
    }
    
    static var time: Float64 {
        get {
            return glfwGetTime()
        }
        set {
            glfwSetTime(newValue)
        }
    }
}
