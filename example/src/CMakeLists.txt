cmake_minimum_required(VERSION 3.0)
project(IntrospectionDemo)

# The CheckTypeSize CMake module uses the try_compile command internally
include(CheckTypeSize)
check_type_size("long" IntrospectionDemo_SIZEOF_LONG)

# To determine if there is an 80 bit or 64 bit floating point stack
# https://github.com/google/double-conversion/blob/d4d68e4e788bec89d55a6a3e33af674087837c82/double-conversion/utils.h#L60-L69
set(_test_source "${CMAKE_CURRENT_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/double-correction-needed.cc")
file(WRITE ${_test_source} "
#include <stdio.h>
int main(int, char **)
{
  const double correct = 89255.0/1e22;
  printf(\"89255.0/1e22 = %g\", correct);
  if( correct != 89255e-22 )
    {
    // correction required
    return 0;
    }
  return 1;
}")
try_run(IntrospectionDemo_DOUBLE_CORRECTION_NEEDED DOUBLE_CORRECT_NEEDED_COMPILED
  ${CMAKE_CURRENT_BINARY_DIR} ${_test_source}
  RUN_OUTPUT_VARIABLE _double_correction_out)
message(STATUS "Double correction test returned: ${_double_correction_out}")


configure_file(IntrospectionDemoConfigure.h.in
  IntrospectionDemoConfigure.h)


add_executable(IntrospectionDemo IntrospectionDemo.cxx)
target_include_directories(IntrospectionDemo PUBLIC ${CMAKE_CURRENT_BINARY_DIR})


include(CTest)
add_test(NAME IntrospectionDemoTest COMMAND IntrospectionDemo)
