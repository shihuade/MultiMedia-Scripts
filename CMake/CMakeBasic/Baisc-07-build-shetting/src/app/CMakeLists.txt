#*****************************************************************
include_directories(${PROJECT_SOURCE_DIR}/src/lib)
#also can add include path with relative path format as below
#include_directories(../lib)
#*****************************************************************

set(APP_SRC main.c)

add_executable(hello ${APP_SRC})

target_link_libraries(hello libhello)
