import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/company_details_controller.dart';
import 'package:internup/core/utils/insert_inbetween.dart';
import 'package:internup/data/models/bookmark.dart';
import 'package:internup/data/repositories/comapnies.dart';
import 'package:internup/ui/pages/report_company.dart';
import 'package:internup/ui/widgets/details_pages/appbar.dart';
import 'package:internup/ui/widgets/details_pages/edit_remove_button.dart';
import 'package:internup/ui/widgets/details_pages/logo_name.dart';
import 'package:internup/ui/widgets/loading.dart';
import 'package:unicons/unicons.dart';
import 'package:internup/ui/widgets/details_pages/contact_button.dart';
import 'package:internup/ui/widgets/details_pages/info_box.dart';

class MyCompanyDetails extends StatelessWidget {
  final int companyId;
  const MyCompanyDetails({super.key, required this.companyId});

  @override
  Widget build(BuildContext context) {
    CompanyDetailsController companyDetailsController =
        Get.put(CompanyDetailsController(CompaniesRepository(), companyId: companyId));

    return Scaffold(
        appBar:
            MyDetailsAppBar("Company Details", bookmark: Bookmark(type: "company", id: companyId)),
        body: Obx(
          () => companyDetailsController.loading.value == "loading"
              ? const Center(child: AnimatedLoading())
              : SingleChildScrollView(
                  child: Container(
                  padding: const EdgeInsets.all(16),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() =>
                          MyDetailsLogoName(title: companyDetailsController.company.value.name)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: Obx(() => MyContactButton(
                                    icon: UniconsLine.phone,
                                    text: companyDetailsController.company.value.phone ??
                                        "Unknown Phone",
                                  ))),
                          const SizedBox(width: 16),
                          Expanded(
                              child: Obx(() => MyContactButton(
                                    icon: UniconsLine.link,
                                    text: companyDetailsController.company.value.website ??
                                        "Unknown Website",
                                  ))),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                          width: Get.width,
                          child: Obx(() => MyContactButton(
                                icon: UniconsLine.at,
                                text:
                                    companyDetailsController.company.value.email ?? "Unknown Email",
                              ))),
                      const SizedBox(height: 16),
                      Row(
                        children: insertInbetween<Widget>(
                            list: companyDetailsController
                                .socialMediaMap()
                                .map((social) => Expanded(
                                        child: MyContactButton(
                                      icon: social["icon"],
                                    )))
                                .toList(),
                            insert: const SizedBox(width: 12)),
                      ),
                      const SizedBox(height: 16),
                      MyInfoBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => companyDetailsController.company.value.description != null
                                ? MyInfoSection(
                                    title: "Description:",
                                    marginBottom: 12,
                                    child: Text(
                                      companyDetailsController.company.value.description!,
                                      style:
                                          const TextStyle(color: Color(0xBF000000), fontSize: 12),
                                    ))
                                : Container()),
                            Obx(() => companyDetailsController.company.value.industries != null
                                ? MyInfoSection(
                                    title: "Industries:",
                                    marginBottom: 12,
                                    child: MyInfoSectionItemList(
                                      items: companyDetailsController.industriesMap(),
                                    ))
                                : Container()),
                            Obx(() => MyInfoSection(
                                title: "Used Technologies:",
                                marginBottom: 12,
                                child: MyInfoSectionItemList(
                                  items: companyDetailsController.technologiesMap(),
                                ))),
                            MyInfoSection(
                                title: "Address:",
                                marginBottom: 12,
                                child: Obx(() => Text(
                                      companyDetailsController.company.value.address!,
                                      style:
                                          const TextStyle(color: Color(0xBF000000), fontSize: 12),
                                    ))),
                            MyInfoSection(
                                title: "Work Locations:",
                                child: Obx(() => Text(
                                      companyDetailsController.company.value.locationsString(),
                                      style:
                                          const TextStyle(color: Color(0xBF000000), fontSize: 12),
                                    ))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      MyEditRemoveButton(
                        onTap: () {
                          Get.to(() => MyReportCompanyPage(
                                type: "Company",
                                company: companyDetailsController.company.value,
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
