import 'package:internup/data/models/social.dart';

class SocialMediaRepository {
  Future<List<SocialMedia>> getSocialMedias() async {
    return [
      SocialMedia.fromJson({
        "id": 0,
        "name": "LinkedIn",
        "link": "https://www.linkedin.com",
      }),
      SocialMedia.fromJson({
        "id": 1,
        "name": "Facebook",
        "link": "https://www.facebook.com",
      }),
      SocialMedia.fromJson({
        "id": 2,
        "name": "Instagram",
        "link": "https://www.instagram.com",
      }),
      SocialMedia.fromJson({
        "id": 3,
        "name": "WhatsApp",
        "link": "https://www.whatsapp.com",
      }),
    ];
  }
}
