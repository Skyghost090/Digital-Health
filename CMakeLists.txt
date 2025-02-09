cmake_minimum_required(VERSION 3.31)
add_subdirectory(csv-parser)
project(digitalwellbig)
add_executable(timeout timeout.cpp)
target_link_libraries(timeout csv)
#find_package(Qt6 REQUIRED COMPONENTS Widgets)
#qt_standard_project_setup()


#add_executable(ui
#    ui.cpp
#)

#target_link_libraries(ui PRIVATE Qt6::Widgets)
