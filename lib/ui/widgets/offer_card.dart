import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/companies_list_controller.dart';
import 'package:internup/data/models/offer.dart';
import 'package:internup/ui/pages/offers/offer_details.dart';
import 'package:unicons/unicons.dart';

class MyOfferCard extends StatelessWidget {
  final Offer offer;

  final EdgeInsetsGeometry? margin;

  const MyOfferCard(this.offer, {super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    CompaniesListController companiesListController = Get.find<CompaniesListController>();

    return GestureDetector(
      onTap: () {
        Get.to( MyOfferDetails( offerId: offer.id,));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Get.theme.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                offer.parsedDate,
                style: const TextStyle(fontFamily: "FlamaBold", fontSize: 16, letterSpacing: 1.25),
              )),
              Text(
                offer.type,
                style: const TextStyle(fontFamily: "FlamaBold", fontSize: 16, letterSpacing: 1.25),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 64,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Get.theme.primaryColor),
                      borderRadius: const BorderRadius.all(Radius.circular(16))),
                  child: const Icon(
                    UniconsLine.linux,
                    size: 48,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            offer.name,
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "FlamaSemiBold",
                                height: 1.1,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      Text(
                        companiesListController.companyName(offer.companyId),
                        style: const TextStyle(
                            fontSize: 16, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              const Text(
                "Industries: ",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.25,
                  fontFamily: "FlamaMedium",
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Obx(
                        () => Text(
                          offer.industriesString().value,
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                        ),
                      )),
                ),
              )
            ],
          ),
           Row(
            children: [
              const Text(
                "Locations: ",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.25,
                  fontFamily: "FlamaMedium",
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(() => Text(
                      offer.locationsString().value,
                      style: const TextStyle(
                          fontSize: 12, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                    ),)
                  ),
                ),
              )
            ],
          ),
           Row(
            children: [
              const Text(
                "Tech Used: ",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.25,
                  fontFamily: "FlamaMedium",
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Obx(()=>Text(
                      offer.technologiesString().value,
                      style: const TextStyle(
                          fontSize: 12, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                    ),)
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
