install(
    TARGETS redis_exe
    RUNTIME COMPONENT redis_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
