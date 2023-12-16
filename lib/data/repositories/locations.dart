import 'package:internup/data/models/location.dart';

class LocationsRepository {
  Future<List<Location>> getLocations() async {
    return <Location>[
      Location.fromJson({
        "id": 0,
        "name": "Location1 Name",
        "link": null,
      }),
      Location.fromJson({
        "id": 1,
        "name": "Location2 Name",
        "link": null,
      }),
      Location.fromJson({
        "id": 2,
        "name": "Location3 Name",
        "link": null,
      }),
    ];
  }
}
