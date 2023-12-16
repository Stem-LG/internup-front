import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/bookmarks_controller.dart';
import 'package:internup/controllers/companies_list_controller.dart';
import 'package:internup/controllers/offers_list_controller.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/data/models/offer.dart';
import 'package:internup/ui/widgets/company_card.dart';
import 'package:internup/ui/widgets/offer_card.dart';

import '../../widgets/search_bar.dart';

class BookmarksList extends StatelessWidget {
  const BookmarksList({super.key});

  @override
  Widget build(BuildContext context) {
    BookmarksController bookmarksController = Get.find<BookmarksController>();
    CompaniesListController companiesListController = Get.find<CompaniesListController>();
    OffersListController offersListController = Get.find<OffersListController>();

    return Column(
      children: [
        MySearchBar(),
        Expanded(
          child: SingleChildScrollView(
              child: Obx(
            () => Column(
              children: bookmarksController.bookmarksList.map((bookmark) {
                switch (bookmark.type) {
                  case "company":
                    Company? company = companiesListController.companyById(bookmark.id);
                    return company != null ? MyCompanyCard(company) : Container();
                  case "offer":
                    Offer? offer = offersListController.offerById(bookmark.id);
                    return offer != null ? MyOfferCard(offer) : Container();
                  default:
                    return Container();
                }
              }).toList(),
            ),
          )),
        ),
      ],
    );
  }
}
