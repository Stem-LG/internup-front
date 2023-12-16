import 'package:get/get.dart';
import 'package:internup/data/models/industry.dart';
import 'package:internup/data/repositories/industries.dart';

class IndustryController extends GetxController {

  final IndustriesRepository _industriesRepository;

  IndustryController(this._industriesRepository);


  RxList<Industry> industries = <Industry>[].obs;

  @override
  void onInit() {
    super.onInit();
    getIndustries();
  }

  Future<void> getIndustries() async {
    List<Industry> industryList = await _industriesRepository.getIndustries();

    industries.addAll(industryList);
  }
}
