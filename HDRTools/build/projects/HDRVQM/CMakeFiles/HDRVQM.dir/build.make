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
include projects/HDRVQM/CMakeFiles/HDRVQM.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include projects/HDRVQM/CMakeFiles/HDRVQM.dir/compiler_depend.make

# Include the progress variables for this target.
include projects/HDRVQM/CMakeFiles/HDRVQM.dir/progress.make

# Include the compile flags for this target's objects.
include projects/HDRVQM/CMakeFiles/HDRVQM.dir/flags.make

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/flags.make
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQM.cpp
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o -MF CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o.d -o CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQM.cpp"

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQM.cpp" > CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.i

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQM.cpp" -o CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.s

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/flags.make
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQMFrame.cpp
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o -MF CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o.d -o CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQMFrame.cpp"

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQMFrame.cpp" > CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.i

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/HDRVQMFrame.cpp" -o CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.s

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/flags.make
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o: /Users/daandebolster/Documents/Studies/Masters\ dissertation/Git\ workspace/_gitFiles/HDRTools/projects/HDRVQM/src/ProjectParameters.cpp
projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o: projects/HDRVQM/CMakeFiles/HDRVQM.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o -MF CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o.d -o CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o -c "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/ProjectParameters.cpp"

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.i"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/ProjectParameters.cpp" > CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.i

projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.s"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM/src/ProjectParameters.cpp" -o CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.s

# Object files for target HDRVQM
HDRVQM_OBJECTS = \
"CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o" \
"CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o" \
"CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o"

# External object files for target HDRVQM
HDRVQM_EXTERNAL_OBJECTS =

bin/HDRVQM: projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQM.cpp.o
bin/HDRVQM: projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/HDRVQMFrame.cpp.o
bin/HDRVQM: projects/HDRVQM/CMakeFiles/HDRVQM.dir/src/ProjectParameters.cpp.o
bin/HDRVQM: projects/HDRVQM/CMakeFiles/HDRVQM.dir/build.make
bin/HDRVQM: lib/libHDRLib.a
bin/HDRVQM: projects/HDRVQM/CMakeFiles/HDRVQM.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../bin/HDRVQM"
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HDRVQM.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
projects/HDRVQM/CMakeFiles/HDRVQM.dir/build: bin/HDRVQM
.PHONY : projects/HDRVQM/CMakeFiles/HDRVQM.dir/build

projects/HDRVQM/CMakeFiles/HDRVQM.dir/clean:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" && $(CMAKE_COMMAND) -P CMakeFiles/HDRVQM.dir/cmake_clean.cmake
.PHONY : projects/HDRVQM/CMakeFiles/HDRVQM.dir/clean

projects/HDRVQM/CMakeFiles/HDRVQM.dir/depend:
	cd "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/projects/HDRVQM" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM" "/Users/daandebolster/Documents/Studies/Masters dissertation/Git workspace/_gitFiles/HDRTools/build/projects/HDRVQM/CMakeFiles/HDRVQM.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : projects/HDRVQM/CMakeFiles/HDRVQM.dir/depend

