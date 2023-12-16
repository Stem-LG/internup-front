import 'package:get/get.dart';
import 'package:internup/controllers/bookmarks_controller.dart';
import 'package:internup/controllers/companies_list_controller.dart';
import 'package:internup/controllers/industry_controller.dart';
import 'package:internup/controllers/info_page_controller.dart';
import 'package:internup/controllers/location_controller.dart';
import 'package:internup/controllers/nav_bar_controller.dart';
import 'package:internup/controllers/offers_list_controller.dart';
import 'package:internup/controllers/socialmedia_controller.dart';
import 'package:internup/controllers/technologies_controller.dart';
import 'package:internup/data/repositories/bookmarks.dart';
import 'package:internup/data/repositories/comapnies.dart';
import 'package:internup/data/repositories/industries.dart';
import 'package:internup/data/repositories/locations.dart';
import 'package:internup/data/repositories/offers.dart';
import 'package:internup/data/repositories/socialmedia.dart';
import 'package:internup/data/repositories/technologies.dart';
import 'package:internup/data/repositories/version.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NavBarController>(NavBarController());
    Get.put<IndustryController>(IndustryController(IndustriesRepository()));
    Get.put<LocationController>(LocationController(LocationsRepository()));
    Get.put<TechnologiesController>(TechnologiesController(TechnologiesRepository()));
    Get.put<SocialMediaController>(SocialMediaController(SocialMediaRepository()));
    Get.put<CompaniesListController>(CompaniesListController(CompaniesRepository()));
    Get.put<OffersListController>(OffersListController(OffersRepository()));
    Get.put<BookmarksController>(BookmarksController(BookmarksRepository()));
    Get.put<InfoPageController>(InfoPageController(VersionRepository()));
    // Get.lazyPut<GetConnect>(()=>GetConnect());
  }
}
