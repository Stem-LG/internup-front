import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/data/models/offer.dart';
import 'package:internup/ui/widgets/company_card.dart';
import 'package:internup/ui/widgets/details_pages/appbar.dart';
import 'package:internup/ui/widgets/details_pages/edit_remove_button.dart';
import 'package:internup/ui/widgets/form/outlined_input.dart';
import 'package:internup/ui/widgets/form/titled_report_section.dart';
import 'package:internup/ui/widgets/offer_card.dart';
import 'package:unicons/unicons.dart';

class MyReportCompanyPage extends StatelessWidget {
  final String type;
  final Company? company;
  final Offer? offer;

  MyReportCompanyPage({super.key, this.type = "Company", this.company, this.offer}) {
    assert(type == "Company" && company != null || type == "Offer" && offer != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyDetailsAppBar("Edit / Remove"),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                type == "Company"
                    ? MyCompanyCard(
                        company!,
                        margin: const EdgeInsets.all(0),
                        clickable: false,
                      )
                    : MyOfferCard(
                        offer!,
                        margin: const EdgeInsets.all(0),
                      ),
                const MyTitledReportSection(
                    title: "UserInfo",
                    child: Column(
                      children: [
                        MyCustomOutlinedInput(label: "Full Name"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(label: "Your Company's Name"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(label: "Email"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(label: "Phone"),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22), // No padding
                  child: const Divider(
                    height: 1, // Set the height of the divider // Set the color of the divider
                  ),
                ),
                const MyTitledReportSection(
                    title: "Details",
                    child: MyCustomOutlinedInput(
                      maxLines: 6,
                      hint: "What do you want to edit ?\nOr what do you want to remove ?",
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 200,
                    child: MyEditRemoveButton(
                        text: "Submit", icon: UniconsLine.message, onTap: () {})),
                const SizedBox(height: 128),
              ],
            ),
          ),
        ));
  }
}
