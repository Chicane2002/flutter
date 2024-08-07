import 'package:flutter/material.dart';
import 'package:harmonica/screens/homePage.dart';
import 'package:harmonica/screens/homePageactual.dart';
import 'package:harmonica/screens/loadingScreen.dart';

// FAILURE: Build failed with an exception.

// * What went wrong:
// Execution failed for task ':app:checkDebugDuplicateClasses'.
// > A failure occurred while executing com.android.build.gradle.internal.tasks.CheckDuplicatesRunnable
//    > Duplicate class kotlin.collections.jdk8.CollectionsJDK8Kt found in modules jetified-kotlin-stdlib-1.8.10 (org.jetbrains.kotlin:kotlin-stdlib:1.8.10) and jetified-kotlin-stdlib-jdk8-1.6.21 (org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.6.21)
//      Duplicate class kotlin.internal.jdk7.JDK7PlatformImplementations found in modules jetified-kotlin-stdlib-1.8.10 (org.jetbrains.kotlin:kotlin-stdlib:1.8.10) and jetified-kotlin-stdlib-jdk7-1.7.10 (org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.7.10)
//      Duplicate class kotlin.internal.jdk7.JDK7PlatformImplementations$ReflectSdkVersion found in modules jetified-kotlin-stdlib-1.8.10 (org.jetbrains.kotlin:kotlin-stdlib:1.8.10) and jetified-kotlin-stdlib-jdk7-1.7.10 (org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.7.10)
//      Duplicate class kotlin.internal.jdk8.JDK8PlatformImplementations found in modules jetified-kotlin-stdlib-1.8.10 (org.jetbrains.kotlin:kotlin-stdlib:1.8.10) and jetified-kotlin-stdlib-jdk8-1.6.21 (org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.6.21)

// to debug the above error use the older version of the package your are trying to install
// in pubspec file

void main() => runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        // home: LoadingScreen(),
        initialRoute: "/",
        routes: {
          '/': (context) => const LoadingScreen(),
          '/home': (context) => Home(),
          '/home2': (context) => const HomePage2(),
        },
      ),
    );
