
ANDROID_STUDIO_DIR="$HOME/opt/android-studio"
if [ -d "$ANDROID_STUDIO_DIR" ]; then
    PATH="$ANDROID_STUDIO_DIR/bin:$PATH"
fi

ANDROID_SDK_DIR="$HOME/Android/Sdk"
if [ -d "$ANDROID_SDK_DIR" ]; then
    PATH="$PATH:$ANDROID_SDK_DIR/platform-tools:$ANDROID_SDK_DIR/tools"
fi

ANDROID_NDK_DIR="$HOME/opt/android-ndk-r10d"
if [ -d "$ANDROID_SDK_DIR" ]; then
    PATH="$ANDROID_NDK_DIR:$PATH"
fi
