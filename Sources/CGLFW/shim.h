#define GLFW_INCLUDE_NONE
#include <GLFW/glfw3.h>
#if __APPLE__
    #define GLFW_EXPOSE_NATIVE_COCOA
    #define GLFW_EXPOSE_NATIVE_NSGL
#elif __linux__

#endif
#include <GLFW/glfw3native.h>

