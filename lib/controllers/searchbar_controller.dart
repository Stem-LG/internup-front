import 'package:get/get.dart';

class SearchBarController extends GetxController {
  final filterExpanded = false.obs;

  void toggleFilter() {
    filterExpanded.value = !filterExpanded.value;
  }
}
