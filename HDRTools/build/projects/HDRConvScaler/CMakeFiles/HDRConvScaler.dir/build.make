# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.24.2/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.24.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build"

# Include any dependencies generated for this target.
include projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.make

# Include the progress variables for this target.
include projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/progress.make

# Include the compile flags for this target's objects.
include projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScaler.cpp
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o -MF CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o.d -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScaler.cpp"

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScaler.cpp" > CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.i

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScaler.cpp" -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.s

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerEXR.cpp
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o -MF CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o.d -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerEXR.cpp"

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerEXR.cpp" > CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.i

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerEXR.cpp" -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.s

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerTIFF.cpp
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o -MF CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o.d -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerTIFF.cpp"

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerTIFF.cpp" > CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.i

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerTIFF.cpp" -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.s

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerYUV.cpp
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o -MF CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o.d -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerYUV.cpp"

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerYUV.cpp" > CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.i

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/HDRConvScalerYUV.cpp" -o CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.s

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/flags.make
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/ProjectParameters.cpp
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o -MF CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o.d -o CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/ProjectParameters.cpp"

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/ProjectParameters.cpp" > CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.i

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler/src/ProjectParameters.cpp" -o CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.s

# Object files for target HDRConvScaler
HDRConvScaler_OBJECTS = \
"CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o" \
"CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o" \
"CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o" \
"CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o" \
"CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o"

# External object files for target HDRConvScaler
HDRConvScaler_EXTERNAL_OBJECTS =

bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScaler.cpp.o
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerEXR.cpp.o
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerTIFF.cpp.o
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/HDRConvScalerYUV.cpp.o
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/src/ProjectParameters.cpp.o
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/build.make
bin/HDRConvScaler: lib/libHDRLib.a
bin/HDRConvScaler: projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX executable ../../bin/HDRConvScaler"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HDRConvScaler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/build: bin/HDRConvScaler
.PHONY : projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/build

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/clean:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" && $(CMAKE_COMMAND) -P CMakeFiles/HDRConvScaler.dir/cmake_clean.cmake
.PHONY : projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/clean

projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/depend:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvScaler" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : projects/HDRConvScaler/CMakeFiles/HDRConvScaler.dir/depend

