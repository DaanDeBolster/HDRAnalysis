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
include projects/HDRConvert/CMakeFiles/HDRConvert.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.make

# Include the progress variables for this target.
include projects/HDRConvert/CMakeFiles/HDRConvert.dir/progress.make

# Include the compile flags for this target's objects.
include projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvert.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvert.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvert.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvert.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertEXR.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertEXR.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertEXR.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertEXR.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScale.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScale.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScale.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScale.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScaleTIFF.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScaleTIFF.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScaleTIFF.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertScaleTIFF.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertTIFF.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertTIFF.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertTIFF.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertTIFF.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertYUV.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o -MF CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertYUV.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertYUV.cpp" > CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/HDRConvertYUV.cpp" -o CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.s

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/flags.make
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRConvert/src/ProjectParameters.cpp
projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o: projects/HDRConvert/CMakeFiles/HDRConvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o -MF CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o.d -o CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/ProjectParameters.cpp"

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/ProjectParameters.cpp" > CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.i

projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert/src/ProjectParameters.cpp" -o CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.s

# Object files for target HDRConvert
HDRConvert_OBJECTS = \
"CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o" \
"CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o"

# External object files for target HDRConvert
HDRConvert_EXTERNAL_OBJECTS =

bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvert.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertEXR.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScale.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertScaleTIFF.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertTIFF.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/HDRConvertYUV.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/src/ProjectParameters.cpp.o
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/build.make
bin/HDRConvert: lib/libHDRLib.a
bin/HDRConvert: projects/HDRConvert/CMakeFiles/HDRConvert.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable ../../bin/HDRConvert"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HDRConvert.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
projects/HDRConvert/CMakeFiles/HDRConvert.dir/build: bin/HDRConvert
.PHONY : projects/HDRConvert/CMakeFiles/HDRConvert.dir/build

projects/HDRConvert/CMakeFiles/HDRConvert.dir/clean:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" && $(CMAKE_COMMAND) -P CMakeFiles/HDRConvert.dir/cmake_clean.cmake
.PHONY : projects/HDRConvert/CMakeFiles/HDRConvert.dir/clean

projects/HDRConvert/CMakeFiles/HDRConvert.dir/depend:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRConvert" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRConvert/CMakeFiles/HDRConvert.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : projects/HDRConvert/CMakeFiles/HDRConvert.dir/depend

