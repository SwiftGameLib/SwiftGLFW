//
//  Window.swift
//  
//
//  Created by David Green on 1/25/22.
//

import cglfw
import XCTest


public extension GLFW {
    class Window {
        public typealias charFunc = (Character) -> Void
        public typealias keyFunc = (Key, Int32, KeyState, KeyModifiers) -> Void
        static var windowMap: [OpaquePointer: Window] = Dictionary()
        
        
        let glfwWindow: OpaquePointer
        var characterCallback: charFunc?
        var keyCallback: keyFunc?
        
        // MARK: - Window Creation
        public init?(width: Int, height: Int, title: String, monitor: Monitor?, share: Window?) {
            let window = glfwCreateWindow(width.glfwValue, height.glfwValue, title, monitor?.glfwMonitor, share?.glfwWindow)
            guard let window = window else { return nil }
            glfwWindow = window
            Self.windowMap[window] = self
        }
        
        // MARK: - Window Destruction
        deinit {
            glfwDestroyWindow(glfwWindow)
        }
        
        public var shouldClose: Bool {
            get {
                let shouldClose = glfwWindowShouldClose(glfwWindow) != 0
                return shouldClose
            }
            set {
                glfwSetWindowShouldClose(glfwWindow, newValue ? 1 : 0)
            }
        }
        
        public func makeContextCurrent() {
            glfwMakeContextCurrent(glfwWindow)
        }
        
        public var title: String {
            get {
                return ""
            }
            set {
                glfwSetWindowTitle(glfwWindow, newValue)
            }
        }
        
        
        public func swapBuffers() {
            glfwSwapBuffers(glfwWindow)
        }
        
        public var frameBufferSize: (width: Int, height: Int) {
            var width: Int32 = 0
            var height: Int32 = 0
            glfwGetFramebufferSize(glfwWindow, &width, &height)
            return (Int(width), Int(height))
        }
        
        public func setCharCallback(funcHandler: charFunc?) {
            self.characterCallback = funcHandler
            if funcHandler == nil {
                glfwSetCharCallback(glfwWindow, nil)
            } else {
                glfwSetCharCallback(glfwWindow) { windowPtr, codepoint in
                    guard let windowPtr = windowPtr else { return }
                    guard let window = Window.windowMap[windowPtr] else { return }
                    guard let unicode = UnicodeScalar(codepoint) else { return }
                    window.characterCallback?(Character(unicode))
                }
            }
        }
        
        public func setKeyCallback(funcHandler: keyFunc?) {
            self.keyCallback = funcHandler
            if funcHandler == nil {
                glfwSetKeyCallback(glfwWindow, nil)
            } else {
                glfwSetKeyCallback(glfwWindow) { windowPtr, key, scancode, action, mods in
                    guard let windowPtr = windowPtr else { return }
                    guard let window = Window.windowMap[windowPtr] else { return }
                    var keyState: KeyState = .unknown
                    if action == GLFW_PRESS {
                        keyState = .pressed
                    } else if action == GLFW_REPEAT {
                        keyState = .repeating
                    } else if action == GLFW_RELEASE {
                        keyState = .pressed
                    }
                    window.keyCallback?(Key(rawValue: key)!, scancode, keyState, KeyModifiers(rawValue: mods))
                    
                }
            }
        }
        
        public func getKey(key: Key) -> KeyState {
            let keyState = glfwGetKey(glfwWindow, key.rawValue)
            if keyState == GLFW_PRESS {
                return .pressed
            }
            return .released
        }
    }
    
    static func pollEvents() {
        glfwPollEvents()
    }
    
}
