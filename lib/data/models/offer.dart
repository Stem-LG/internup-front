import 'package:get/get.dart';
import 'package:internup/controllers/location_controller.dart';
import 'package:internup/controllers/technologies_controller.dart';
import 'package:internup/data/models/industry.dart';
import 'package:internup/data/models/location.dart';
import 'package:internup/controllers/industry_controller.dart';
import 'package:internup/data/models/technology.dart';
import 'package:intl/intl.dart';

class Offer {
  static const String defaultLogoUrl = "https://i.ibb.co/JKxNW54/default-logo.png";
  static const String unknownDate = "Unknown Date";
  static const String unknownType = "Unknown Type";
  static const String unknownIndustries = "Unknown Industries";
  static const String unknownLocations = "Unknown Locations";
  static const String unknownTechnologies = "Unknown Technologies";

  final int id;
  final String name;
  final String logoUrl;
  final String? description;
  final String type;
  final DateTime? date;
  final int companyId;
  final String? email;
  final String? phone;
  final String? applicationLink;
  final List<int>? locations;
  final List<int>? industries;
  final List<int>? tech;

  const Offer(
      {required this.id,
      required this.name,
      this.logoUrl = defaultLogoUrl,
      this.description,
      this.type = unknownType,
      this.date,
      this.companyId = -1,
      this.email,
      this.phone,
      this.applicationLink,
      this.locations,
      this.industries,
      this.tech});


  factory Offer.empty(){
    return const Offer(id: -1, name: "Default Offer");
  }

  factory Offer.previewFromJson(Map<String, dynamic> json) {
    return Offer(
        id: json['id'],
        name: json['name'] ?? "No Title",
        logoUrl: json['logoUrl'] ?? defaultLogoUrl,
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
        type: json['type'] ?? unknownType,
        companyId: json['companyId'] ?? -1,
        locations: List<int>.from(json['locations']),
        industries: List<int>.from(json['industries']),
        tech: List<int>.from(json["tech"]));
  }

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
        id: json['id'],
        name: json['name'],
        logoUrl: json['logoUrl'] ?? defaultLogoUrl,
        description: json['description'],
        type: json['type'] ?? unknownType,
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
        companyId: json['companyId'],
        email: json['email'],
        phone: json['phone'],
        applicationLink: json['applicationLink'],
        locations: List<int>.from(json['locations']),
        industries: List<int>.from(json['industries']),
        tech: List<int>.from(json["tech"]));
  }

  String get parsedDate => date != null ? DateFormat("dd/MM/yyyy").format(date!) : unknownDate;

  RxString locationsString() {
    LocationController locationController = Get.find<LocationController>();

    String result = unknownLocations;

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

    return result.obs;
  }

  RxString industriesString() {
    IndustryController industryController = Get.find<IndustryController>();

    String result = unknownIndustries;

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

    return result.obs;
  }

  RxString technologiesString() {
    TechnologiesController technologiesController = Get.find<TechnologiesController>();

    String result = unknownTechnologies;

    if (industries != null && industries!.isNotEmpty) {
      result = industries!
          .map((id) {
            Technology? item =
                technologiesController.technologies.firstWhereOrNull((element) => element.id == id);
            return item?.name;
          })
          .where((name) => name != null)
          .join(', ');
    }

    return result.obs;
  }
}
