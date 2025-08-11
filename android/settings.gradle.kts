pluginManagement {
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("../local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    includeBuild(flutterSdkPath)

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-gradle-plugin").version("1.0.0").apply(false)
    id("com.android.application").version("8.2.2").apply(false)
    id("org.jetbrains.kotlin.android").version("1.9.23").apply(false)
    id("com.google.gms.google-services").version("4.4.2").apply(false)
}

include(":app")

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
