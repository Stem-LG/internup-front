import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/searchbar_controller.dart';
import 'package:unicons/unicons.dart';

class MySearchBar extends StatelessWidget {


  
  MySearchBar({super.key});

  final SearchBarController controller = Get.put(SearchBarController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Get.theme.primaryColor, width: 2))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
                width: Get.width,
                height: 64,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: const TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 1.25),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                prefixIcon: const SizedBox(
                                  width: 48,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Icon(UniconsLine.search),
                                  ),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2), // Outline border color
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2), // Outline border color
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 0),
                        child: Obx(() => IconButton(onPressed: controller.toggleFilter, icon: Icon(controller.filterExpanded.value ? UniconsLine.filter_slash : UniconsLine.filter))),
                      ),
                    ],
                  ),
                )),
            Obx(
              () => AnimatedContainer(
                height: controller.filterExpanded.value ? 122 : 0,
                duration: const Duration(milliseconds: 250),
                child: const MyFilterSection(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyFilterSection extends StatelessWidget {
  const MyFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClipRect(
      child: OverflowBox(
        maxHeight: 122,
        alignment: Alignment.topCenter,
        child: Flex(direction: Axis.vertical, children: [
          SizedBox(height: 6),
          Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                  flex: 1,
                  child: MyPlaceholderWidget(
                    name: "Location",
                  )),
              SizedBox(width: 10),
              Flexible(flex: 1, child: MyPlaceholderWidget(name: "Industry")),
            ],
          ),
          SizedBox(height: 10),
          Flexible(flex: 1, child: MyPlaceholderWidget(name: "Technology")),
        ]),
      ),
    );
  }
}

class MyPlaceholderWidget extends StatelessWidget {
  final String name;

  const MyPlaceholderWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 48),
      itemBuilder: (context) => [const PopupMenuItem(child: Text('test'))],
      clipBehavior: Clip.antiAlias,
      child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Get.theme.primaryColor, width: 2)),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                name,
                style: TextStyle(fontSize: 20, color: Get.theme.primaryColor, fontFamily: "FlamaBasic", letterSpacing: 1.25),
              )),
              const Icon(UniconsLine.angle_down)
            ],
          )),
    );
  }
}
