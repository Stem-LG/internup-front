import 'package:internup/data/models/technology.dart';

class TechnologiesRepository {
  Future<List<Technology>> getTechnologies() async {
    //some api call simulation

    return <Technology>[
      Technology.fromJson({
        "id": 0,
        "name": "Flutter",
        "link": null,
      }),
      Technology.fromJson({
        "id": 1,
        "name": "Figma",
        "link": null,
      }),
      Technology.fromJson({
        "id": 2,
        "name": "Supabase",
        "link": null,
      }),
      Technology.fromJson({
        "id": 3,
        "name": "Postgres",
        "link": null,
      }),
    ];
  }
}
