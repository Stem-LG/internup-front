import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/info_page_controller.dart';
import 'package:internup/ui/widgets/loading.dart';
import 'package:unicons/unicons.dart';

import '../../../core/utils/url_operations.dart';
import '../../widgets/dialog.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    InfoPageController infoPageController = Get.find<InfoPageController>();

    return ListView(
      children: [
        const Divider(height: 1),
        Obx(() => MyCustomListTile(
              title: "Version",
              subtitle: "v${infoPageController.version.value.version}",
              //get version from pubspec.yaml
            )),
        const Divider(height: 1),
        updateListTile(),
        const Divider(height: 1),
        MyCustomListTile(
          title: "Terms of Use",
          onTap: () {
            Get.dialog(const MyTermsDialog(), barrierDismissible: true);
          },
        ),
        const Divider(height: 1),
        MyCustomListTile(
          title: "Make a Donation",
          subtitle: "Your Support is very appreciated <3",
          onTap: () {
            Get.dialog(const MyDonationDialog(), barrierDismissible: true);
          },
        ),
        const Divider(height: 1),
        MyCustomListTile(
          title: "Credits",
          customSubtitleText: RichText(
            text: TextSpan(style: DefaultTextStyle.of(context).style, children: <TextSpan>[
              const TextSpan(text: 'This app was made by:  '),
              const TextSpan(
                text: 'Louay Ghanney',
                style: TextStyle(fontFamily: "FlamaBold"),
              ),
              const TextSpan(text: ' \n\nMore info @ '),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => easyLaunchUrl("https://www.louay.tn"),
                text: 'www.louay.tn',
                style:
                    const TextStyle(fontFamily: "FlamaBold", decoration: TextDecoration.underline),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

Widget updateListTile() {
  InfoPageController infoPageController = Get.find<InfoPageController>();

  return Obx(
    () {
      switch (infoPageController.status.value) {
        case "loading":
          return const MyCustomListTile(
            title: "Checking for Updates...",
            onTap: null,
            trailing: AnimatedLoading(
              size: 24,
              customText: "",
            ),
          );
        case "no update":
          return const MyCustomListTile(
            title: "You're on the latest version !",
            onTap: null,
          );
        case "update available":
          return MyCustomListTile(
            title: "v${infoPageController.latestVersion.value.version} is available",
            onTap: null,
            trailing: SizedBox(
              height: 48,
              width: 48,
              child: TextButton(
                  style: TextButton.styleFrom(
                      side: BorderSide(color: Get.theme.primaryColor, width: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Icon(UniconsLine.file_download),
                  onPressed: () {
                    easyLaunchUrl(infoPageController.latestVersion.value.url);
                  }),
            ),
          );
        default:
          return MyCustomListTile(
              title: "Check for updates",
              onTap: () {
                infoPageController.getLatestVersion();
              });
      }
    },
  );
}

class MyCustomListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? customSubtitleText;
  final Function? onTap;
  final Widget? trailing;

  const MyCustomListTile(
      {super.key,
      required this.title,
      this.subtitle,
      this.customSubtitleText,
      this.onTap,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontFamily: "FlamaMedium", letterSpacing: 1)),
      subtitle: subtitle != null ? Text(subtitle!) : customSubtitleText,
      onTap: onTap != null ? () => onTap!() : null,
      style: ListTileStyle.list,
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 32),
      trailing: trailing,
    );
  }
}

class MyTermsDialog extends StatelessWidget {
  const MyTermsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomDialog(
      title: "Terms of Use",
      body: Container(
        height: 420,
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: const SingleChildScrollView(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet. Pellentesque commodo lacus at sodales sodales. Quisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet. Pellentesque commodo lacus at sodales sodales. Quisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id., Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet. Pellentesque commodo lacus at sodales sodales. Quisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque nibh nibh, at maximus ante fermentum sit amet. Pellentesque commodo lacus at sodales sodales. Quisque sagittis orci ut diam condimentum, vel euismod erat placerat. In iaculis arcu eros, eget tempus orci facilisis id.',
            style: TextStyle(fontSize: 13, letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}

class MyDonationDialog extends StatelessWidget {
  const MyDonationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCustomDialog(
      title: "Donation",
      body: Column(children: [
        Text(
          "E-Dinar D17",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Icon(
          UniconsLine.qrcode_scan,
          size: 200,
        ),
        SizedBox(height: 8),
        Text(
          "+216 90656399",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 45),
        Text(
          "Thank You",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
      ]),
    );
  }
}
