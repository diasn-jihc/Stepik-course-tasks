# Course 14.5.6 вЂ” Local WebView

This Flutter lesson loads assets/index.html in a WebView and connects JavaScript to Flutter with MyJSChannel.

## Run

1. Select an Android emulator or an Android/iOS device in VS Code.
2. Run flutter pub get from this folder.
3. Start the app with flutter run.

The webview_flutter implementation used in this lesson does not support Windows or Linux desktop. Those targets display a short platform message instead of opening a WebView.

## Local page interactions

- Change color changes the page background and sends a message to Flutter.
- Reset restores the dark background.
- The Flutter app displays WebView load progress and offers retry after a resource error.
