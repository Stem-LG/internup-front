import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/core/routes.dart';
import 'package:internup/ui/pages/companies/suggest_company.dart';
import 'package:internup/ui/pages/offers/publish_offer.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  bool isInfoPage() {
    try {
      return currentIndex.value ==
          pages.indexOf(pages.firstWhere((element) => element["name"] == "Info"));
    } catch (e) {
      return false;
    }
  }

  bool isFabVisible() {
    return currentIndex.value < 2;
  }

  String fabTitle() {
    switch(pages[currentIndex.value]["name"]) {
      case "Companies":
        return "Suggest a Company";
      case "Offers":
        return "Publish an Offer";
      default:
        return "";
    }
  }
  Widget? fabPage() {
    switch(pages[currentIndex.value]["name"]) {
      case "Companies":
        return const MyCompanySuggestionPage();
      case "Offers":
        return const MyOfferPublishingPage();
      default:
        return null;
    }
  }
}
