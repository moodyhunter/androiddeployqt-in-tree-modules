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

## 4. Run `diff -r ./x ./y` to compare two different directories.

> Note that folder `x` contains `libqml_subdir_test_subdirplugin_x86_64.so` and is the correct result.

```diff
Binary files ./x/assets/android_rcc_bundle.rcc and ./y/assets/android_rcc_bundle.rcc differ
Only in ./x/lib/x86_64: libqml_subdir_test_subdirplugin_x86_64.so
Only in ./x/lib/x86_64: libsubdir_x86_64.so
Binary files ./x/lib/x86_64/libTestAppMain_x86_64.so and ./y/lib/x86_64/libTestAppMain_x86_64.so differ
Binary files ./x/META-INF/CERT.RSA and ./y/META-INF/CERT.RSA differ
diff '--color=auto' -r ./x/META-INF/CERT.SF ./y/META-INF/CERT.SF
3c3
< SHA-256-Digest-Manifest: Ld685o7y8wRBSYX4mPXzLRJI6EC4o1j07/EmKeAy8nM=
---
> SHA-256-Digest-Manifest: MQ9wAQV4sznVF6kUbd2Cyl2BM6M4/CbDir2F8N+tENU=
13c13
< SHA-256-Digest: V1bkvh7ttWX8EHvRgQRGr2vSXDuRd30pSoAD1m0xf1Q=
---
> SHA-256-Digest: f00kiwY3HP9YHdDuqMTmquo6e9wYD3r2gAhHXbzSzEg=
64c64
< SHA-256-Digest: CJ9NKMMjPPNxxMbS2Mg0RaSxm4xZYgMMkvpjDZcN5UQ=
---
> SHA-256-Digest: 0AvKzmROYnRwQoAKvYw+imzI/sFPGorn6M1uP8Gg61c=
195,200d194
< Name: lib/x86_64/libqml_subdir_test_subdirplugin_x86_64.so
< SHA-256-Digest: vp4ABr8K8zSO+mGwUdpDKSBFjAOLnrrOLLo863jexYg=
< 
< Name: lib/x86_64/libsubdir_x86_64.so
< SHA-256-Digest: xFwN4iHwxh2cWqc44Njqms6lkHyKyba3MfqlJ/0t1Ng=
< 
202c196
< SHA-256-Digest: P12YTd9/J8cmXd7J0ru3TbyCx7k5pP0RdijWh+EmYYU=
---
> SHA-256-Digest: zl3x7eHSvikV0Fxo/kANYqhGO+up0FPW8wTTFWYD21Q=
diff '--color=auto' -r ./x/META-INF/MANIFEST.MF ./y/META-INF/MANIFEST.MF
12c12
< SHA-256-Digest: OsF8IKnoGGvfx3oKyw+N01Ewe8vZPQCWucPcSmrC6Jo=
---
> SHA-256-Digest: Xw7KXI1dmyK+oAwAJLNxjL+CSpzppXgT3mdXHlWDbug=
63c63
< SHA-256-Digest: 735X4qo2FFMxvDswlfF20CFTSb1bk02PK7Tm6x749ng=
---
> SHA-256-Digest: bxtEWaDQxMMbqzX3Kn8ROsXDFGvbel+llS7thkOyhAM=
194,199d193
< Name: lib/x86_64/libqml_subdir_test_subdirplugin_x86_64.so
< SHA-256-Digest: /w4K8dclEer8UYi2lRn00Oga8lzQIawXp3YrU+TQcBE=
<
< Name: lib/x86_64/libsubdir_x86_64.so
< SHA-256-Digest: qTcmZPK79KvWLXIgmvhW8axTel+w/zydfJHG/sgXaOU=
<
201c195
< SHA-256-Digest: 4o/bC6DvdPwFs/SHZ09QUJCsew7V5hLtmKO+gX3Y46Q=
---
> SHA-256-Digest: n421aGrISk16bsQPC5kKio1O6Lo8+5ZlFElR1iNucl0=
Binary files ./x/resources.arsc and ./y/resources.arsc differ
```
