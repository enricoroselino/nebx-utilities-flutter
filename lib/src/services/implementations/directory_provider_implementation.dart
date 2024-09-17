import 'package:nebx_utilities/nebx_utilities.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:universal_io/io.dart';

class DirectoryProviderImplementation implements IDirectoryProvider {
  late final IPermissionManager _permissionManager;

  DirectoryProviderImplementation() {
    _permissionManager = PermissionManagerImplementation();
  }

  @override
  Future<Directory> getDownloadsDirectory({String? appNameContainer}) async {
    Directory? platformDownloadDir;
    final defaultDownloadDir = await pp.getDownloadsDirectory() as Directory;

    await _permissionManager.requestStorage();
    await _permissionManager.requestStorageLegacy();

    if (Platform.isAndroid) {
      platformDownloadDir = _buildAndroidDownloadDir(appName: appNameContainer);
    }

    if (Platform.isWindows) {
      platformDownloadDir = _buildWindowsDownloadDir(
        basePath: defaultDownloadDir.path,
        appName: appNameContainer,
      );
    }

    return platformDownloadDir ?? defaultDownloadDir;
  }
}

Directory _buildAndroidDownloadDir({required String? appName}) {
  const baseDownloadPath = "/storage/emulated/0/Download";
  final structure = [baseDownloadPath];
  if (appName != null) structure.add(appName);
  final downloadPath = p.joinAll(structure);
  return Directory(downloadPath);
}

Directory _buildWindowsDownloadDir({
  required String basePath,
  required String? appName,
}) {
  final structure = [basePath];
  if (appName != null) structure.add(appName);
  final downloadPath = p.joinAll(structure);
  return Directory(downloadPath);
}
