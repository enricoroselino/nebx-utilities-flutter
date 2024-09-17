/*
* As per Google Play store new policy there is no need to get/request any permission to write or read files from storage.
* This is applicable only for (your) App owned directory such as: Cache, Temporary, External, Document, Download directories etc.
*/

import 'package:universal_io/io.dart';

/// Directory provider and prompt a related permission request
abstract interface class IDirectoryProvider {
  /// windows and android contained inside application name
  /// appName is a container folder if not using app owned directory
  Future<Directory> getDownloadsDirectory({String? appNameContainer});
}
