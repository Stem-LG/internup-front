import 'package:get/get.dart';
import 'package:internup/controllers/industry_controller.dart';
import 'package:internup/controllers/technologies_controller.dart';
import 'package:internup/data/models/offer.dart';
import 'package:internup/data/repositories/offers.dart';

class OfferDetailsController extends GetxController {
  final OffersRepository _offersRepository;
  final int offerId;

  OfferDetailsController(this._offersRepository, {required this.offerId});

  RxString loading = "loading".obs;
  Rx<Offer> offer = Offer.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getOfferDetails();
  }

  void getOfferDetails() async {
    loading.value = "loading";
    offer.value = await _offersRepository.getOffer(offerId);
    loading.value = "success";
  }

  List<Map<String, String>> industriesMap() {
    IndustryController industryController = Get.find<IndustryController>();
    if (offer.value.industries == null) {
      return [];
    }

    List<Map<String, String>> res = industryController.industries
        .where((industry) => offer.value.industries!.contains(industry.id))
        .map((e) => {"title": e.name})
        .toList();

    return res;
  }

  List<Map<String, String>> technologiesMap() {
    TechnologiesController technologiesController = Get.find<TechnologiesController>();
    if (offer.value.tech == null) {
      return [];
    }

    List<Map<String, String>> res = technologiesController.technologies
        .where((technology) => offer.value.tech!.contains(technology.id))
        .map((e) => {"title": e.name})
        .toList();

    return res;
  }
}
