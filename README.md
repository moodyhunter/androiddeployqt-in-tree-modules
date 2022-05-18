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

## 4. Differences between correct build (x) and (y)

```diff
Binary files ./x/assets/android_rcc_bundle.rcc and ./y/assets/android_rcc_bundle.rcc differ
Only in ./x/lib/x86_64: libqml_some_sub_dir_subdirplugin_x86_64.so
Only in ./x/lib/x86_64: libqml_subdir_test_subdirplugin_x86_64.so
Only in ./x/lib/x86_64: libsubdir_x86_64.so
Binary files ./x/lib/x86_64/libTestAppMain_x86_64.so and ./y/lib/x86_64/libTestAppMain_x86_64.so differ
Binary files ./x/META-INF/CERT.RSA and ./y/META-INF/CERT.RSA differ
diff '--color=auto' -r ./x/META-INF/CERT.SF ./y/META-INF/CERT.SF
3c3
< SHA-256-Digest-Manifest: l62/KuGSB+Pe5jylQly9BG/mnpdsbiBYvuuskKrv4vU=
---
> SHA-256-Digest-Manifest: QIgf3l1b/vais3zogOn5GOdp6M1rj6hokysg5RDDi9I=
13c13
< SHA-256-Digest: j4Nm6WcdAbSMxlK2YxPIxTj9RP6rIUWwBk7Tj/hWaYg=
---
> SHA-256-Digest: gqX90z1ojkjqCnroyzNZC0Vyr6XO3I8b1yppU90DMNs=
64c64
< SHA-256-Digest: nakShtwfaOswnLOj/K6YrXHPckQdj74Q9id8rieXzUg=
---
> SHA-256-Digest: py38T5okIJ+E8AJ4yj0mLfRKCtntFWsRXohEzLtp2fk=
195,203d194
< Name: lib/x86_64/libqml_some_sub_dir_subdirplugin_x86_64.so
< SHA-256-Digest: eFzvsjitiitXocRzHECViQjRa/ZGpR1tQ/H0qw1urgM=
<
< Name: lib/x86_64/libqml_subdir_test_subdirplugin_x86_64.so
< SHA-256-Digest: vp4ABr8K8zSO+mGwUdpDKSBFjAOLnrrOLLo863jexYg=
<
< Name: lib/x86_64/libsubdir_x86_64.so
< SHA-256-Digest: 1SHfEKeIB1C/LEo084lct8PKy4/42gPNLSRWPlwfpqI=
<
205c196
< SHA-256-Digest: 4Esf53T5LDhE7fAHMqutZLv4MA91IwvpiP3cLtBX96I=
---
> SHA-256-Digest: zl3x7eHSvikV0Fxo/kANYqhGO+up0FPW8wTTFWYD21Q=
diff '--color=auto' -r ./x/META-INF/MANIFEST.MF ./y/META-INF/MANIFEST.MF
12c12
< SHA-256-Digest: 7whQFkDEJsWqhkIW8BLtgSBfXWp4gZljOoPli77IXQE=
---
> SHA-256-Digest: 0KRaeNVVenjoOULUcOANoNEUNLj/S025XpjiJCgkGvU=
63c63
< SHA-256-Digest: wCckFxqJUv74q9tdUBM7Hr749ZGAoTQE5eB+bbTXNK4=
---
> SHA-256-Digest: rFFBrmvcAK9tM7kpFMTvRBKc4j1gWtwSp1Jd/jBQNX4=
194,202d193
< Name: lib/x86_64/libqml_some_sub_dir_subdirplugin_x86_64.so
< SHA-256-Digest: do7mCNwk+5M1LZsDXhLjlbixG3BFQLSGx50J97GQ/oc=
<
< Name: lib/x86_64/libqml_subdir_test_subdirplugin_x86_64.so
< SHA-256-Digest: /w4K8dclEer8UYi2lRn00Oga8lzQIawXp3YrU+TQcBE=
<
< Name: lib/x86_64/libsubdir_x86_64.so
< SHA-256-Digest: soSyimx9cPC6GrsHRFdF/lSmH3Hc1164vzWtifHGG84=
<
204c195
< SHA-256-Digest: 5FRBHPzKS/XozjyWrFBLcvCHx7N/djeFLETe+UUuAvg=
---
> SHA-256-Digest: n421aGrISk16bsQPC5kKio1O6Lo8+5ZlFElR1iNucl0=
Binary files ./x/resources.arsc and ./y/resources.arsc differ
```
