import 'package:get/get.dart';
import 'package:internup/data/models/social.dart';
import 'package:internup/data/repositories/socialmedia.dart';

class SocialMediaController extends GetxController {
  final SocialMediaRepository _socialMediaRepository;

  SocialMediaController(this._socialMediaRepository);

  RxList<SocialMedia> socialMedias = <SocialMedia>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSocialMedias();
  }

  Future<void> getSocialMedias() async {
    List<SocialMedia> socialMediaList = await _socialMediaRepository.getSocialMedias();

    socialMedias.assignAll(socialMediaList);
  }
}
