import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/offers_list_controller.dart';
import 'package:internup/ui/widgets/offer_card.dart';

import '../../widgets/search_bar.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    OffersListController offersListController = Get.find<OffersListController>();

    return Column(
      children: [
        MySearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children:
                    offersListController.offersList.map((offer) => MyOfferCard(offer)).toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
