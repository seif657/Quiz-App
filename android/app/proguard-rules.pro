# Flutter and Dart specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }

# Keep all classes that contain @Keep annotations
-keep @androidx.annotation.Keep class * { *; }

# Keep any other classes you want to preserve
-keep class com.example.project15.** { *; }