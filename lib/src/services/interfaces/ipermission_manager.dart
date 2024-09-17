/// Managing app permission
abstract interface class IPermissionManager {
  /// request to manage external storage
  ///
  /// [ANDROID]: Add following permission inside AndroidManifest.xml
  /// <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE"/>
  /// <application android:requestLegacyExternalStorage="true" .... />
  Future<bool> requestManageExternalStorage();

  /// request for photos, videos and audio at once,
  /// if any not granted, will return false.
  /// This can be use to save at "/storage"
  ///
  /// [ANDROID:] Add following permissions inside AndroidManifest.xml
  /// <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" android:minSdkVersion="33"/>
  /// <uses-permission android:name="android.permission.READ_MEDIA_VIDEO" android:minSdkVersion="33"/>
  /// <uses-permission android:name="android.permission.READ_MEDIA_AUDIO" android:minSdkVersion="33"/>
  Future<bool> requestStorage();

  /// if used on android API 13+ will always return false.
  /// This can be use to save at "/storage".
  ///
  /// [ANDROID:] Add following permissions inside AndroidManifest.xml
  /// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="32"/>
  /// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="32"/>
  Future<bool> requestStorageLegacy();

  /// prompt user an app settings to enable permission manually
  Future openPermissionSettings();
}
