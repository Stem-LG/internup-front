import 'package:internup/data/models/offer.dart';

class OffersRepository {
  Future<List<Offer>> getOffers() async {
    return <Offer>[
      Offer.previewFromJson({
        'id': 0,
        "name": "Development of a Mobile E-Learning Platform",
        "logoURL": "https://i.ibb.co/FzxBLZt/image.png",
        "date": "2023-08-26",
        "type": "PFE",
        "companyId": 1,
        "locations": [0, 1, 2],
        "industries": [0, 1, 2],
        "tech": [0, 1, 2],
      }),
      Offer.previewFromJson({
        'id': 1,
        "name": "Offer1 Name",
        "logoURL": "https://i.ibb.co/FzxBLZt/image.png",
        "date": "2023-08-26",
        "type": "PFE",
        "companyId": 0,
        "locations": [0, 1, 2],
        "industries": [0, 1, 2],
        "tech": [0, 1, 2],
      }),
      Offer.previewFromJson({
        'id': 2,
        "name": null,
        "logoURL": null,
        "date": null,
        "type": null,
        "companyId": null,
        "locations": [],
        "industries": [],
        "tech": [],
      }),
      Offer.previewFromJson({
        'id': 3,
        "name": "Offer1 Name",
        "logoURL": "https://i.ibb.co/FzxBLZt/image.png",
        "date": "2023-08-26",
        "type": "PFE",
        "companyId": 1,
        "locations": [0, 1, 2],
        "industries": [0, 1, 2],
        "tech": [0, 1, 2],
      }),
      Offer.previewFromJson({
        'id': 4,
        "name": "Offer1 Name",
        "logoURL": "https://i.ibb.co/FzxBLZt/image.png",
        "date": "2023-08-26",
        "type": "PFE",
        "companyId": 1,
        "locations": [0, 1, 2],
        "industries": [0, 1, 2],
        "tech": [0, 1, 2],
      }),
    ];
  }

  Future<Offer> getOffer(int offerId) async {
    await Future.delayed(const Duration(seconds: 1));

    return Offer.fromJson({
      'id': offerId,
      "name": "Development of a Mobile E-Learning Plastform",
      "logoURL": "https://i.ibb.co/FzxBLZt/image.png",
      "description": "Offer Description $offerId",
      "type": "PFE$offerId",
      "date": "2023-08-2$offerId",
      "companyId": 1,
      "email": "louayghanney71@gmail.com",
      "phone": "+216 90656399",
      "applicationLink": offerId == 2 ? null : "https://www.louay.com",
      "locations": [0, 1, 2],
      "industries": [0, 1, 2],
      "tech": [0, 1, 2],
    });
  }
}
