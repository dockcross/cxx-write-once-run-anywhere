#include "IntrospectionDemoConfigure.h"

#include <iostream>

int main(int argc, char *argv[]) {

  std::cout << std::endl;
  std::cout << "The 'long' type has " << IntrospectionDemo_SIZEOF_LONG << " bytes." << std::endl;
#if defined(IntrospectionDemo_DOUBLE_CORRECTION_NEEDED)
  std::cout << "This platform needs double correction." << std::endl;
#else
  std::cout << "This platform does not need double correction." << std::endl;
#endif
  std::cout << std::endl;

  return 0;
}
