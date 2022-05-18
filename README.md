# androiddeployqt-in-tree-modules

Test case: Qt 6.3.0 installed via Qt online installer.

## 1. To build it in-tree

```bash
mkdir -p ./build && cd ./build
~/Qt/6.3.0/android_x86_64/bin/qt-cmake .. \
    -DQT_CHAINLOAD_TOOLCHAIN_FILE=$ANDROID_SDK_PATH/build/cmake/android.toolchain.cmake \
    -DANDROID_SDK_ROOT=$ANDROID_SDK_PATH
```

## 2. To build it out-of-tree

```bash
mkdir -p /tmp/some_random_build_dir && cd /tmp/some_random_build_dir
~/Qt/6.3.0/android_x86_64/bin/qt-cmake PATH_TO_SOURCE_DIR \
    -DQT_CHAINLOAD_TOOLCHAIN_FILE=$ANDROID_SDK_PATH/build/cmake/android.toolchain.cmake \
    -DANDROID_SDK_ROOT=$ANDROID_SDK_PATH
```

## 3. Extract the results of both build output APKs

```bash
# Correct build
cd x && unzip OUT_OF_TREE_BUILD/TestAppMain.apk

# Wrong build
cd y && unzip IN_TREE_BUILD/TestAppMain.apk
```
