import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/ui/widgets/details_pages/appbar.dart';
import 'package:internup/ui/widgets/details_pages/edit_remove_button.dart';
import 'package:internup/ui/widgets/form/outlined_input.dart';
import 'package:internup/ui/widgets/form/titled_report_section.dart';
import 'package:unicons/unicons.dart';

class MyOfferPublishingPage extends StatelessWidget {
  const MyOfferPublishingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyDetailsAppBar("Publish an Offer"),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyTitledReportSection(
                    title: "UserInfo",
                    child: Column(
                      children: [
                        MyCustomOutlinedInput(label: "Full Name"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(label: "Company Name"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(label: "Role"),
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
                    title: "Offer Info",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyCustomOutlinedInput(label: "Offer Title"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(
                          maxLines: 9,
                          hint:
                              "  - Offer Description\n  - Internship type (init, perf, pfe...)\n  - HR info* (phone, email, address...)\n  - Work locations (remote, city name...)\n  - Online application link\n  - Industries* (web dev, marketing...)\n  - Tech used (flutter, illustrator...)\n  - Picture link\n  - Anything else...",
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(width: 200, child: MyEditRemoveButton(text: "Submit", icon: UniconsLine.message, onTap: () {})),
                const SizedBox(height: 128),
              ],
            ),
          ),
        ));
  }
}
