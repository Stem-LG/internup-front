import 'package:get/get.dart';
import 'package:internup/data/models/technology.dart';
import 'package:internup/data/repositories/technologies.dart';

class TechnologiesController extends GetxController {
  final TechnologiesRepository _technologiesRepository;

  TechnologiesController(this._technologiesRepository);

  RxList<Technology> technologies = <Technology>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLocations();
  }

  Future<void> getLocations() async {
    List<Technology> technologiesList = await _technologiesRepository.getTechnologies();

    technologies.assignAll(technologiesList);
  }
}
