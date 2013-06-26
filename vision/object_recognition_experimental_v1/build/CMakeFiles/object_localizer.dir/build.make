# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build

# Include any dependencies generated for this target.
include CMakeFiles/object_localizer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/object_localizer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/object_localizer.dir/flags.make

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: CMakeFiles/object_localizer.dir/flags.make
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: ../src/ObjectLocalizer.cpp
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: ../manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/roslang/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/roscpp/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/geometry_msgs/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/sensor_msgs/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/stacks/vision_opencv/opencv2/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/stacks/vision_opencv/cv_bridge/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/std_msgs/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/ros/core/rosbuild/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/roslib/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/rosconsole/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/stacks/pluginlib/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/share/message_filters/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /opt/ros/fuerte/stacks/image_common/image_transport/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /home/marco/fuerte_workspace/tbots_vision_pkg/feature_extraction/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /home/marco/fuerte_workspace/tbots_vision_pkg/image_processing/manifest.xml
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /home/marco/fuerte_workspace/tbots_vision_pkg/feature_extraction/msg_gen/generated
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /home/marco/fuerte_workspace/tbots_vision_pkg/feature_extraction/srv_gen/generated
CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o: /home/marco/fuerte_workspace/tbots_vision_pkg/image_processing/srv_gen/generated
	$(CMAKE_COMMAND) -E cmake_progress_report /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -o CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o -c /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/src/ObjectLocalizer.cpp

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/object_localizer.dir/src/ObjectLocalizer.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -E /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/src/ObjectLocalizer.cpp > CMakeFiles/object_localizer.dir/src/ObjectLocalizer.i

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/object_localizer.dir/src/ObjectLocalizer.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -W -Wall -Wno-unused-parameter -fno-strict-aliasing -pthread -S /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/src/ObjectLocalizer.cpp -o CMakeFiles/object_localizer.dir/src/ObjectLocalizer.s

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.requires:
.PHONY : CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.requires

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.provides: CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.requires
	$(MAKE) -f CMakeFiles/object_localizer.dir/build.make CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.provides.build
.PHONY : CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.provides

CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.provides.build: CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o

# Object files for target object_localizer
object_localizer_OBJECTS = \
"CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o"

# External object files for target object_localizer
object_localizer_EXTERNAL_OBJECTS =

../bin/object_localizer: CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o
../bin/object_localizer: CMakeFiles/object_localizer.dir/build.make
../bin/object_localizer: CMakeFiles/object_localizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/object_localizer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/object_localizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/object_localizer.dir/build: ../bin/object_localizer
.PHONY : CMakeFiles/object_localizer.dir/build

CMakeFiles/object_localizer.dir/requires: CMakeFiles/object_localizer.dir/src/ObjectLocalizer.o.requires
.PHONY : CMakeFiles/object_localizer.dir/requires

CMakeFiles/object_localizer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/object_localizer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/object_localizer.dir/clean

CMakeFiles/object_localizer.dir/depend:
	cd /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1 /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1 /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build /home/marco/fuerte_workspace/athomesoftware/vision/object_recognition_experimental_v1/build/CMakeFiles/object_localizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/object_localizer.dir/depend

