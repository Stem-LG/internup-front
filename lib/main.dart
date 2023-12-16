import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/core/initial_bindings.dart';
import 'package:internup/controllers/nav_bar_controller.dart';
import 'package:internup/ui/theme.dart';
import 'package:internup/ui/widgets/nav_bar.dart';
import 'package:internup/ui/widgets/custom_fab.dart';
import 'package:internup/core/routes.dart';

void main() {
  runApp(DevicePreview(
    builder: ((context) => const MainApp()),
    enabled: GetPlatform.isDesktop || GetPlatform.isWeb || !kReleaseMode,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: "InternUp",
      theme: lightTheme,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.find<NavBarController>();

    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("InternUp"),
            toolbarHeight: navBarController.isInfoPage() ? 150 : 56,
          ),
          body: IndexedStack(
            index: navBarController.currentIndex.value,
            children: pages.map((e) => e["page"] as Widget).toList(),
          ),
          floatingActionButton: navBarController.isFabVisible()
              ? MyCustomFab(
                  title: navBarController.fabTitle(),
                  onTap: () => Get.to(navBarController.fabPage()),
                )
              : null,
          bottomNavigationBar: MyBottomNavBar(),
        ));
  }
}
