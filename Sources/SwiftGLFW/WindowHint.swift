//
//  WindowHint.swift
//  
//
//  Created by David Green on 1/25/22.
//

import Foundation

public extension GLFW.Window {
    // MARK: - Window Creation Hints
    enum WindowHint {
        case resizable(Bool)
        case visible(Bool)
        case decorated(Bool)
        case focused(Bool)
        case autoIconify(Bool)
        case floating(Bool)
        case Maximized(Bool)
        case centerCursor(Bool)
        case transparentFramebuffer(Bool)
        case focusOnShow(Bool)
        case scaleToMonitor(Bool)
        case redBits(Int?)
        case greenBits(Int?)
        case blueBits(Int?)
        case alphaBits(Int?)
        case depthBits(Int?)
        case stencilBits(Int?)
        case accumulatorRedBits(Int?)
        case accumulatorGreenBits(Int?)
        case accumulatorBlueBits(Int?)
        case accumulatorAlphaBits(Int?)
        case auxBuffers(Int?)
        case samples(Int?)
        case refreshRate(Int?)
        case stereo(Bool)
        case srgbCapable(Bool)
        case doublebuffer(Bool)
        
        public enum ClientAPI: GLFWValueProviding {
            case openGL
            case openGLES
            case none
            internal var glfwValue: Int32 {
                switch self {
                case .openGL:
                    return GLFW_OPENGL_API
                case .openGLES:
                    return GLFW_OPENGL_ES_API
                case .none:
                    return GLFW_NO_API
                }
            }
        }
        case clientAPI(ClientAPI)
        
        public enum ContextCreationAPI: GLFWValueProviding {
            case native
            case egl
            case osMesa
            internal var glfwValue: Int32 {
                switch self {
                case .native:
                    return GLFW_NATIVE_CONTEXT_API
                case .egl:
                    return GLFW_EGL_CONTEXT_API
                case .osMesa:
                    return GLFW_OSMESA_CONTEXT_API
                }
            }
        }
        case contextCreationAPI(ContextCreationAPI)
        case contextVersionMajor(Int)
        case contextVersionMinor(Int)
        
        public enum ContextRobustness: GLFWValueProviding {
            case noRobustness
            case noResetNotification
            case loseContextOnReset
            internal var glfwValue: Int32 {
                switch self {
                case .noRobustness:
                    return GLFW_NO_ROBUSTNESS
                case .noResetNotification:
                    return GLFW_NO_RESET_NOTIFICATION
                case .loseContextOnReset:
                    return GLFW_LOSE_CONTEXT_ON_RESET
                }
            }
        }
        case contextRobustness(ContextRobustness)
        
        public enum ContextReleaseBehavior: GLFWValueProviding {
            case any
            case flush
            case none
            internal var glfwValue: Int32 {
                switch self {
                case .any:
                    return GLFW_ANY_RELEASE_BEHAVIOR
                case .flush:
                    return GLFW_RELEASE_BEHAVIOR_FLUSH
                case .none:
                    return GLFW_RELEASE_BEHAVIOR_NONE
                }
            }
        }
        case contextReleaseBehavior(ContextReleaseBehavior)
        case openGLForwardCompatibility(Bool)
        case openGLDebugContext(Bool)
        
        public enum OpenGLProfile: GLFWValueProviding {
            case any
            case compatible
            case core
            internal var glfwValue: Int32 {
                switch self {
                case .any:
                    return GLFW_OPENGL_ANY_PROFILE
                case .compatible:
                    return GLFW_OPENGL_COMPAT_PROFILE
                case .core:
                    return GLFW_OPENGL_CORE_PROFILE
                }
            }
        }
        case openGLProfile(OpenGLProfile)
        
#if os(macOS)
        case cocoaRetinaFramebuffer(Bool)
        case cocoaFrameName(String)
        case cocoaGraphicsSwitching(Bool)
#endif
        
#if os(Linux)
        case x11ClassName(String)
        case x11InstanceName(String)
#endif
    }
    
    static func defaultWindowHints() {
        glfwDefaultWindowHints()
    }
    
    static func setWindowHint(_ hint: WindowHint) {
        var hintID: Int32!
        var hintValue: Int32!
        
        switch hint {
        case .resizable(let value):
            hintID = GLFW_RESIZABLE
            hintValue = value.glfwValue
        case .visible(let value):
            hintID = GLFW_VISIBLE
            hintValue = value.glfwValue
        case .decorated(let value):
            hintID = GLFW_DECORATED
            hintValue = value.glfwValue
        case .focused(let value):
            hintID = GLFW_FOCUSED
            hintValue = value.glfwValue
        case .autoIconify(let value):
            hintID = GLFW_AUTO_ICONIFY
            hintValue = value.glfwValue
        case .floating(let value):
            hintID = GLFW_FLOATING
            hintValue = value.glfwValue
        case .Maximized(let value):
            hintID = GLFW_MAXIMIZED
            hintValue = value.glfwValue
        case .centerCursor(let value):
            hintID = GLFW_CENTER_CURSOR
            hintValue = value.glfwValue
        case .transparentFramebuffer(let value):
            hintID = GLFW_TRANSPARENT_FRAMEBUFFER
            hintValue = value.glfwValue
        case .focusOnShow(let value):
            hintID = GLFW_FOCUS_ON_SHOW
            hintValue = value.glfwValue
        case .scaleToMonitor(let value):
            hintID = GLFW_SCALE_TO_MONITOR
            hintValue = value.glfwValue
        case .redBits(let value):
            hintID = GLFW_RED_BITS
            hintValue = value.glfwValue
        case .greenBits(let value):
            hintID = GLFW_GREEN_BITS
            hintValue = value.glfwValue
        case .blueBits(let value):
            hintID = GLFW_BLUE_BITS
            hintValue = value.glfwValue
        case .alphaBits(let value):
            hintID = GLFW_ALPHA_BITS
            hintValue = value.glfwValue
        case .depthBits(let value):
            hintID = GLFW_DEPTH_BITS
            hintValue = value.glfwValue
        case .stencilBits(let value):
            hintID = GLFW_STENCIL_BITS
            hintValue = value.glfwValue
        case .accumulatorRedBits(let value):
            hintID = GLFW_ACCUM_RED_BITS
            hintValue = value.glfwValue
        case .accumulatorGreenBits(let value):
            hintID = GLFW_ACCUM_GREEN_BITS
            hintValue = value.glfwValue
        case .accumulatorBlueBits(let value):
            hintID = GLFW_ACCUM_BLUE_BITS
            hintValue = value.glfwValue
        case .accumulatorAlphaBits(let value):
            hintID = GLFW_ACCUM_ALPHA_BITS
            hintValue = value.glfwValue
        case .auxBuffers(let value):
            hintID = GLFW_AUX_BUFFERS
            hintValue = value.glfwValue
        case .samples(let value):
            hintID = GLFW_SAMPLES
            hintValue = value.glfwValue
        case .refreshRate(let value):
            hintID = GLFW_REFRESH_RATE
            hintValue = value.glfwValue
        case .stereo(let value):
            hintID = GLFW_STEREO
            hintValue = value.glfwValue
        case .srgbCapable(let value):
            hintID = GLFW_SRGB_CAPABLE
            hintValue = value.glfwValue
        case .doublebuffer(let value):
            hintID = GLFW_DOUBLEBUFFER
            hintValue = value.glfwValue
        case .clientAPI(let value):
            hintID = GLFW_CLIENT_API
            hintValue = value.glfwValue
        case .contextCreationAPI(let value):
            hintID = GLFW_CONTEXT_CREATION_API
            hintValue = value.glfwValue
        case .contextVersionMajor(let value):
            hintID = GLFW_CONTEXT_VERSION_MAJOR
            hintValue = value.glfwValue
        case .contextVersionMinor(let value):
            hintID = GLFW_CONTEXT_VERSION_MINOR
            hintValue = value.glfwValue
        case .contextRobustness(let value):
            hintID = GLFW_CONTEXT_ROBUSTNESS
            hintValue = value.glfwValue
        case .contextReleaseBehavior(let value):
            hintID = GLFW_CONTEXT_RELEASE_BEHAVIOR
            hintValue = value.glfwValue
        case .openGLForwardCompatibility(let value):
            hintID = GLFW_OPENGL_FORWARD_COMPAT
            hintValue = value.glfwValue
        case .openGLDebugContext(let value):
            hintID = GLFW_OPENGL_DEBUG_CONTEXT
            hintValue = value.glfwValue
        case .openGLProfile(let value):
            hintID = GLFW_OPENGL_PROFILE
            hintValue = value.glfwValue
#if os(macOS)
        case .cocoaRetinaFramebuffer(let value):
            hintID = GLFW_COCOA_RETINA_FRAMEBUFFER
            hintValue = value.glfwValue
        case .cocoaFrameName(let value):
            hintID = GLFW_COCOA_FRAME_NAME
            glfwWindowHintString(hintID, value)
            return
        case .cocoaGraphicsSwitching(let value):
            hintID = GLFW_COCOA_GRAPHICS_SWITCHING
            hintValue = value.glfwValue
#endif
#if os(Linux)
        case .x11ClassName(let value):
            hintID = GLFW_X11_CLASS_NAME
            glfwWindowHintString(hintID, value)
            return
        case .x11InstanceName(let value):
            hintID = GLFW_X11_INSTANCE_NAME
            glfwWindowHintString(hintID, value)
            return
#endif
        }
        
        glfwWindowHint(hintID, hintValue)
    }
}
