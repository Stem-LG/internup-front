import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/ui/pages/companies/company_details.dart';
import 'package:unicons/unicons.dart';

class MyCompanyCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;

  final Company company;
  final bool clickable;

  const MyCompanyCard(this.company, {super.key, this.margin, this.clickable = true});

  static const String unknownText = "unknown";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickable
          ? () {
              Get.to(() => MyCompanyDetails(companyId: company.id));
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Get.theme.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(children: [
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
                            company.name,
                            style: const TextStyle(fontSize: 18, fontFamily: "FlamaSemiBold"),
                          ),
                        ),
                      ),
                      Obx(() => Text(
                            company.locationsString(),
                            style: const TextStyle(
                                fontSize: 16, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          )),
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
                    child: Obx(() => Text(
                          company.industriesString(),
                          style: const TextStyle(
                              fontSize: 12, letterSpacing: 1.25, overflow: TextOverflow.ellipsis),
                        )),
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
