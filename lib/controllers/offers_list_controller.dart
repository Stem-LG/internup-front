import 'package:get/get.dart';
import 'package:internup/data/models/offer.dart';
import 'package:internup/data/repositories/offers.dart';

class OffersListController extends GetxController {
  final OffersRepository _offersRepository;

  OffersListController(this._offersRepository);

  RxList<Offer> offersList = <Offer>[].obs;

  @override
  void onInit() {
    super.onInit();
    getOffers();
  }

  void getOffers() async {
    List<Offer> offers = await _offersRepository.getOffers();

    offersList.assignAll(offers);
  }

  Offer? offerById(int companyId) {
    try {
      return offersList.firstWhere((element) => element.id == companyId);
    } catch (e) {
      return null;
    }
  }
}
