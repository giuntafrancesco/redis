# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(redisTests LANGUAGES CXX)

# ---- Tests ----

add_executable(redis_test source/redis_test.cpp)
target_link_libraries(redis_test PRIVATE redis_lib)
target_compile_features(redis_test PRIVATE cxx_std_20)

add_test(NAME redis_test COMMAND redis_test)

# ---- End-of-file commands ----

add_folders(Test)
