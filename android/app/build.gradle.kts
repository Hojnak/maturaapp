plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // POPRAWNA SKŁADNIA DLA TEGO PLIKU:
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.matura_app_final"
    compileSdk = 34

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        applicationId = "com.example.matura_app_final"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Ta linia pomaga zarządzać wersjami bibliotek Firebase
    implementation(platform("com.google.firebase:firebase-bom:33.1.2"))
}
