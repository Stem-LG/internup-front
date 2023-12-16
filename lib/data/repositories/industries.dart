import 'package:internup/data/models/industry.dart';

class IndustriesRepository {
  Future<List<Industry>> getIndustries() async {
    return <Industry>[
      Industry.fromJson({
        "id": 0,
        "name": "Industry1 Name",
        "logo": null,
      }),
      Industry.fromJson({
        "id": 1,
        "name": "Industry2 Name",
        "logo": null,
      }),
      Industry.fromJson({
        "id": 2,
        "name": "Industry3 Name",
        "logo": null,
      }),
    ];
  }
}
