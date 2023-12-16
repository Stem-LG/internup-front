import 'package:get/get.dart';
import 'package:internup/data/models/version.dart';
import 'package:internup/data/repositories/version.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoPageController extends GetxController {
  final VersionRepository _versionRepository;

  InfoPageController(this._versionRepository);

  Rx<Version> version = Version.empty().obs;
  Rx<Version> latestVersion = Version.empty().obs;
  RxString status = "".obs;

  @override
  void onInit() {
    super.onInit();
    getVersion();
  }

  Future<void> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = Version(version: packageInfo.version, url: "");
  }

  Future<void> getLatestVersion() async {
    status.value = "loading";
    latestVersion.value = await _versionRepository.getVersion();
    if (latestVersion.value.version != version.value.version) {
      status.value = "update available";
    } else {
      status.value = "no update";
      await Future.delayed(const Duration(seconds: 3));
      status.value = "";
    }
  }
}
