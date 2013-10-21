# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "vision: 1 messages, 4 services")

set(MSG_I_FLAGS "-Ivision:/home/marco/catkin_ws/src/vision/msg;-Istd_msgs:/opt/ros/hydro/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/hydro/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/hydro/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(vision_generate_messages ALL)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(vision
  "/home/marco/catkin_ws/src/vision/msg/RealObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
)

### Generating Services
_generate_srv_cpp(vision
  "/home/marco/catkin_ws/src/vision/srv/Match.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
)
_generate_srv_cpp(vision
  "/home/marco/catkin_ws/src/vision/srv/GetObjectsInScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
)
_generate_srv_cpp(vision
  "/home/marco/catkin_ws/src/vision/srv/FindObject.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
)
_generate_srv_cpp(vision
  "/home/marco/catkin_ws/src/vision/srv/Contains.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
)

### Generating Module File
_generate_module_cpp(vision
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(vision_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(vision_generate_messages vision_generate_messages_cpp)

# target for backward compatibility
add_custom_target(vision_gencpp)
add_dependencies(vision_gencpp vision_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(vision
  "/home/marco/catkin_ws/src/vision/msg/RealObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
)

### Generating Services
_generate_srv_lisp(vision
  "/home/marco/catkin_ws/src/vision/srv/Match.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
)
_generate_srv_lisp(vision
  "/home/marco/catkin_ws/src/vision/srv/GetObjectsInScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
)
_generate_srv_lisp(vision
  "/home/marco/catkin_ws/src/vision/srv/FindObject.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
)
_generate_srv_lisp(vision
  "/home/marco/catkin_ws/src/vision/srv/Contains.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
)

### Generating Module File
_generate_module_lisp(vision
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(vision_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(vision_generate_messages vision_generate_messages_lisp)

# target for backward compatibility
add_custom_target(vision_genlisp)
add_dependencies(vision_genlisp vision_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(vision
  "/home/marco/catkin_ws/src/vision/msg/RealObject.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
)

### Generating Services
_generate_srv_py(vision
  "/home/marco/catkin_ws/src/vision/srv/Match.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
)
_generate_srv_py(vision
  "/home/marco/catkin_ws/src/vision/srv/GetObjectsInScene.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
)
_generate_srv_py(vision
  "/home/marco/catkin_ws/src/vision/srv/FindObject.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/hydro/share/std_msgs/cmake/../msg/Header.msg;/home/marco/catkin_ws/src/vision/msg/RealObject.msg;/opt/ros/hydro/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/hydro/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
)
_generate_srv_py(vision
  "/home/marco/catkin_ws/src/vision/srv/Contains.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
)

### Generating Module File
_generate_module_py(vision
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(vision_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(vision_generate_messages vision_generate_messages_py)

# target for backward compatibility
add_custom_target(vision_genpy)
add_dependencies(vision_genpy vision_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS vision_generate_messages_py)


debug_message(2 "vision: Iflags=${MSG_I_FLAGS}")


if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/vision
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(vision_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(vision_generate_messages_cpp geometry_msgs_generate_messages_cpp)
add_dependencies(vision_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/vision
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(vision_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(vision_generate_messages_lisp geometry_msgs_generate_messages_lisp)
add_dependencies(vision_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/vision
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(vision_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(vision_generate_messages_py geometry_msgs_generate_messages_py)
add_dependencies(vision_generate_messages_py sensor_msgs_generate_messages_py)