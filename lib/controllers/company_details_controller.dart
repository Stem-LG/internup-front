import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/industry_controller.dart';
import 'package:internup/controllers/socialmedia_controller.dart';
import 'package:internup/controllers/technologies_controller.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/data/repositories/comapnies.dart';
import 'package:unicons/unicons.dart';

class CompanyDetailsController extends GetxController {
  final CompaniesRepository _companiesRepository;
  final int companyId;

  CompanyDetailsController(this._companiesRepository, {required this.companyId});

  RxString loading = "loading".obs;
  Rx<Company> company = Company.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getCompanyDetails();
  }

  void getCompanyDetails() async {
    loading.value = "loading";
    company.value = await _companiesRepository.getCompany(companyId);
    loading.value = "success";
  }

  List<Map<String, String>> industriesMap() {
    IndustryController industryController = Get.find<IndustryController>();
    if (company.value.industries == null) {
      return [];
    }

    List<Map<String, String>> res = industryController.industries
        .where((industry) => company.value.industries!.contains(industry.id))
        .map((e) => {"title": e.name})
        .toList();

    return res;
  }

  List<Map<String, String>> technologiesMap() {
    TechnologiesController technologiesController = Get.find<TechnologiesController>();
    if (company.value.tech == null) {
      return [];
    }

    List<Map<String, String>> res = technologiesController.technologies
        .where((technology) => company.value.tech!.contains(technology.id))
        .map((e) => {"title": e.name})
        .toList();

    return res;
  }

  List<Map<String, dynamic>> socialMediaMap() {
    SocialMediaController socialMediaController = Get.find<SocialMediaController>();
    if (company.value.socials == null) {
      return [];
    }

    List<Map<String, dynamic>> res = socialMediaController.socialMedias
        .where((socialMedia) => company.value.socials!.contains(socialMedia.id))
        .map((e) {
      IconData icon;

      switch (e.name) {
        case "LinkedIn":
          icon = UniconsLine.linkedin_alt;
          break;
        case "Facebook":
          icon = UniconsLine.facebook_f;
          break;
        case "Instagram":
          icon = UniconsLine.instagram;
          break;
        case "WhatsApp":
          icon = UniconsLine.whatsapp;
          break;
        default:
          icon = UniconsLine.question_circle;
      }

      return {"title": e.name, "link": e.link, "icon": icon};
    }).toList();

    return res;
  }
}

class UniconsThinLine {}
