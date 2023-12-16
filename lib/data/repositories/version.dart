import 'package:internup/data/models/version.dart';

class VersionRepository {
  Future<Version> getVersion() async {
    await Future.delayed(const Duration(seconds: 1));
    return Version.fromJson({"version": "0.7.0", "url": "http://www.louay.tn"});
  }
}
