import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/companies_list_controller.dart';
import 'package:internup/controllers/offer_details_controller.dart';
import 'package:internup/core/utils/url_operations.dart';
import 'package:internup/data/models/bookmark.dart';
import 'package:internup/data/repositories/offers.dart';
import 'package:internup/ui/pages/report_company.dart';
import 'package:internup/ui/widgets/details_pages/appbar.dart';
import 'package:internup/ui/widgets/details_pages/contact_button.dart';
import 'package:internup/ui/widgets/details_pages/logo_name.dart';
import 'package:internup/ui/widgets/loading.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/details_pages/edit_remove_button.dart';
import '../../widgets/details_pages/info_box.dart';
import '../../widgets/custom_fab.dart';

class MyOfferDetails extends StatelessWidget {
  final int offerId;

  const MyOfferDetails({super.key, required this.offerId});

  @override
  Widget build(BuildContext context) {
    OfferDetailsController offerDetailsController =
        Get.put(OfferDetailsController(OffersRepository(), offerId: offerId));
    CompaniesListController companiesListController = Get.find<CompaniesListController>();
    return Scaffold(
        appBar: MyDetailsAppBar("Offer Details", bookmark: Bookmark(type: "offer", id: offerId)),
        floatingActionButton: Obx(() => offerDetailsController.offer.value.applicationLink != null
            ? MyCustomFab(
                title: "Click to Apply",
                onTap: () => easyLaunchUrl(offerDetailsController.offer.value.applicationLink!))
            : Container()),
        body: Obx(
          () => offerDetailsController.loading.value == "loading"
              ? const Center(
                  child: AnimatedLoading(),
                )
              : SingleChildScrollView(
                  child: Container(
                  padding: const EdgeInsets.all(16),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            offerDetailsController.offer.value.parsedDate,
                            style: TextStyle(fontSize: 16, fontFamily: "FlamaBold"),
                          ),
                          Text(
                            offerDetailsController.offer.value.type,
                            style: TextStyle(fontSize: 16, fontFamily: "FlamaBold"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      MyDetailsLogoName(
                        title: offerDetailsController.offer.value.name,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: MyContactButton(
                                  text: offerDetailsController.offer.value.phone,
                                  icon: UniconsLine.phone)),
                          SizedBox(width: 16),
                          Expanded(
                              child: MyContactButton(
                                  text: companiesListController
                                      .companyName(offerDetailsController.offer.value.companyId),
                                  icon: UniconsLine.building)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                          width: Get.width,
                          child: MyContactButton(
                              text: offerDetailsController.offer.value.email,
                              icon: UniconsLine.at)),
                      const SizedBox(height: 16),
                      MyInfoBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyInfoSection(
                                title: "Description:",
                                child: Text(
                                  offerDetailsController.offer.value.description ??
                                      "No Description",
                                  style: TextStyle(color: Color(0xBF000000), fontSize: 12),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            MyInfoSection(
                                title: "Industries:",
                                child: MyInfoSectionItemList(
                                  items: offerDetailsController.industriesMap(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            MyInfoSection(
                                title: "Used Technologies:",
                                child: MyInfoSectionItemList(
                                  items: offerDetailsController.technologiesMap(),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            MyInfoSection(
                                title: "Address:",
                                child: Text(
                                  companiesListController
                                      .companyAddress(offerDetailsController.offer.value.companyId),
                                  style: TextStyle(color: Color(0xBF000000), fontSize: 12),
                                )),
                            SizedBox(
                              height: 12,
                            ),
                            MyInfoSection(
                                title: "Work Locations:",
                                child: Text(
                                  offerDetailsController.offer.value.locationsString().value,
                                  style: TextStyle(color: Color(0xBF000000), fontSize: 12),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      MyEditRemoveButton(
                        onTap: () {
                          Get.to(() => MyReportCompanyPage(
                                type: "Offer",
                                offer: offerDetailsController.offer.value,
                              ));
                        },
                      ),
                      const SizedBox(height: 128),
                    ],
                  ),
                )),
        ));
  }
}
