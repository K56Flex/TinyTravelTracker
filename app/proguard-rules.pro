# To enable ProGuard in your project, edit project.properties
# to define the proguard.config property as described in that file.
#
# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in ${sdk.dir}/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the ProGuard
# include property in project.properties.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
#-keep class ** implements com.rareventure.android.AndroidPreferenceSet$AndroidPreferences {*;}
-dontobfuscate
-keep class com.rareventure.gps2.ITrialService

-keep class com.rareventure.gps2.bootup.GpsTrailerReceiver


#ACRA specifics
# we need line numbers in our stack traces otherwise they are pretty useless
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

# ACRA needs "annotations" so add this... 
-keepattributes *Annotation*

# keep this class so that logging will show 'ACRA' and not a obfuscated name like 'a'.
# Note: if you are removing log messages elsewhere in this file then this isn't necessary
-keep class org.acra.ACRA {
        *;
}

# keep this around for some enums that ACRA needs
-keep class org.acra.ReportingInteractionMode {
   *;
}

# keep this otherwise it is removed by ProGuard
-keep public class org.acra.ErrorReporter
{
public void addCustomData(java.lang.String,java.lang.String);
}

# keep this otherwise it is removed by ProGuard
-keep public class org.acra.ErrorReporter
{
public org.acra.ErrorReporter$ReportsSenderWorker handleSilentException(java.lang.Throwable);
}

#map controller has native code that calls back mapcontroller methods, so we need to
#keep it
-keep public class com.mapzen.tangram.MapController {
    *;
    }

-keep public class com.mapzen.tangram.MapController$FeaturePickListener {
    *;
    }


-dontwarn android.**
-dontwarn retrofit.**
-dontwarn okio.**
-dontwarn dagger.**
-dontwarn com.google.**
