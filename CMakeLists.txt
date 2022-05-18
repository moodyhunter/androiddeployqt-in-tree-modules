cmake_minimum_required(VERSION 3.16)

project(qtbase-411805 VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.2 COMPONENTS Core Network Quick REQUIRED)
qt_standard_project_setup()

add_subdirectory(subdir)

qt_add_executable(TestAppMain main.cpp)

qt_add_qml_module(TestAppMain
    URI "some.random.main"
    VERSION 1.0
    QML_FILES   main.qml
    IMPORT_PATH ${CMAKE_BINARY_DIR}
)

target_link_libraries(TestAppMain PRIVATE Qt::Quick)
