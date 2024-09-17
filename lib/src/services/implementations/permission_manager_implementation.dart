import 'package:device_info_plus/device_info_plus.dart';
import 'package:nebx_utilities/src/services/interfaces/ipermission_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

/// implementation of IPermissionManager using "permission_handler" package
class PermissionManagerImplementation implements IPermissionManager {
  late final DeviceInfoPlugin _deviceInfo;

  PermissionManagerImplementation() {
    _deviceInfo = DeviceInfoPlugin();
  }

  @override
  Future<bool> requestManageExternalStorage() async {
    final status = await Permission.manageExternalStorage.request();
    if (status.isPermanentlyDenied) await openPermissionSettings();
    return status != PermissionStatus.granted ? false : true;
  }

  @override
  Future<bool> requestStorage() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt <= 32) return false;
    }

    final Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.videos,
      Permission.audio,
    ].request();

    if (statuses.values.any((i) => i == PermissionStatus.permanentlyDenied)) {
      await openPermissionSettings();
    }
    return !statuses.values.any((i) => i != PermissionStatus.granted);
  }

  @override
  Future<bool> requestStorageLegacy() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) return false;
    }

    final status = await Permission.storage.request();
    if (status.isPermanentlyDenied) await openPermissionSettings();
    return status != PermissionStatus.granted ? false : true;
  }

  @override
  Future openPermissionSettings() async {
    await openAppSettings();
  }
}
