import 'package:get/get.dart';
import 'package:internup/data/models/location.dart';
import 'package:internup/data/repositories/locations.dart';

class LocationController extends GetxController {

  final LocationsRepository _locationsRepository;

  LocationController(this._locationsRepository);


  RxList<Location> locations = <Location>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  Future<void> getLocations() async {
    List<Location> locationList = await _locationsRepository.getLocations();

    locations.assignAll(locationList);
  }
}
