cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    redis
    VERSION 0.1.0
    DESCRIPTION "my first redis made with c++"
    HOMEPAGE_URL "https://github.com/giuntafrancesco/redis.git"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    redis_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    redis_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(redis_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(redis_exe source/main.cpp)
add_executable(redis::exe ALIAS redis_exe)

set_property(TARGET redis_exe PROPERTY OUTPUT_NAME redis)

target_compile_features(redis_exe PRIVATE cxx_std_20)

target_link_libraries(redis_exe PRIVATE redis_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT redis_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of redis"
  )
endif()

include(cmake/dev-mode.cmake)
