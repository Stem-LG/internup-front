import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/ui/widgets/details_pages/appbar.dart';
import 'package:internup/ui/widgets/details_pages/edit_remove_button.dart';
import 'package:internup/ui/widgets/form/outlined_input.dart';
import 'package:internup/ui/widgets/form/titled_report_section.dart';
import 'package:unicons/unicons.dart';

class MyCompanySuggestionPage extends StatelessWidget {
  const MyCompanySuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyDetailsAppBar("Suggest a Company"),
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
                    title: "Company Info",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyCustomOutlinedInput(label: "Company Name"),
                        SizedBox(
                          height: 10,
                        ),
                        MyCustomOutlinedInput(
                          maxLines: 8,
                          hint:
                              "  - Company Description\n  - Contact info (phone, email...)\n  - Work locations (remote, city name...)\n  - Relevant links (website, linkedin...)\n  - Industries (web dev, marketing...)\n  - Tech used (flutter, illustrator...)\n  - Logo picture link\n  - Anything else...",
                        )
                      ],
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
