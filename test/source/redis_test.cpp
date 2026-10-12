#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "redis" ? 0 : 1;
}
