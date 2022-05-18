cmake_minimum_required(VERSION 3.16)

project(subdir_project)

find_package(Qt6 6.2 REQUIRED COMPONENTS Core Quick)

qt_standard_project_setup()

qt_add_qml_module(subdir
    VERSION 1.0
    URI
        "subdir.test"
    QML_FILES
        SubItem.qml
)
