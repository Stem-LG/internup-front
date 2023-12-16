import 'package:get/get.dart';
import 'package:internup/controllers/industry_controller.dart';
import 'package:internup/controllers/location_controller.dart';
import 'package:internup/data/models/industry.dart';
import 'package:internup/data/models/location.dart';

class Company {
  static const String defaultLogoUrl = "https://i.ibb.co/JKxNW54/default-logo.png";

  final int id;
  final String name;
  final String logoUrl;
  final String? description;
  final String? address;
  final String? email;
  final String? phone;
  final String? website;
  final List<int>? locations;
  final List<int>? industries;
  final List<int>? tech;
  final List<int>? socials;

  const Company(
      {required this.id,
      required this.name,
      this.logoUrl = defaultLogoUrl,
      this.description,
      this.address,
      this.email,
      this.phone,
      this.website,
      this.locations,
      this.industries,
      this.tech,
      this.socials});

  bool isEmpty() {
    return id == -1;
  }

  factory Company.empty() {
    return const Company(id: -1, name: "Default Company");
  }

  factory Company.previewFromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'] ?? defaultLogoUrl,
      locations: List<int>.from(json['locations']),
      industries: List<int>.from(json['industries']),
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'] ?? defaultLogoUrl,
      description: json['description'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      locations: List<int>.from(json['locations']),
      industries: List<int>.from(json['industries']),
      tech: List<int>.from(json['tech']),
      socials: List<int>.from(json['socials']),
    );
  }

  String locationsString() {
    LocationController locationController = Get.find<LocationController>();

    String result = "";

    if (locations != null && locations!.isNotEmpty) {
      result = locations!
          .map((id) {
            Location? item =
                locationController.locations.firstWhereOrNull((element) => element.id == id);
            return item?.name;
          })
          .where((name) => name != null)
          .join(', ');
    }

    return result;
  }

  String industriesString() {
    IndustryController industryController = Get.find<IndustryController>();

    String result = "";

    if (industries != null && industries!.isNotEmpty) {
      result = industries!
          .map((id) {
            Industry? item =
                industryController.industries.firstWhereOrNull((element) => element.id == id);
            return item?.name;
          })
          .where((name) => name != null)
          .join(', ');
    }

    return result;
  }
}
