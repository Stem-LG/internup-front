import 'package:internup/data/models/company.dart';

class CompaniesRepository {
  Future<List<Company>> getCompanies() async {
    return <Company>[
      Company.previewFromJson(
        {
          "id": 0,
          "name": "Company1 Name",
          "logoUrl": "https://i.ibb.co/FzxBLZt/image.png",
          "locations": [0, 1, 2],
          "industries": [3, 0, 1, 2],
        },
      ),
      Company.previewFromJson(
        {
          "id": 1,
          "name": "Lou's Academy",
          "logoUrl": "https://i.ibb.co/FzxBLZt/image.png",
          "locations": [0, 1, 2],
          "industries": [0, 1, 2],
        },
      ),
      Company.previewFromJson(
        {
          "id": 2,
          "name": "Company3 Name",
          "logoUrl": "https://i.ibb.co/FzxBLZt/image.png",
          "locations": [0, 1, 2],
          "industries": [0, 1, 2],
        },
      ),
      Company.previewFromJson(
        {
          "id": 3,
          "name": "Company1 Name",
          "logoUrl": "https://i.ibb.co/FzxBLZt/image.png",
          "locations": [0, 1, 2],
          "industries": [0, 1, 2],
        },
      ),
    ];
  }

  Future<Company> getCompany(int companyId) async {
    await Future.delayed(const Duration(seconds: 1));

    return Company.fromJson({
      "id": companyId,
      "name": companyId == 1 ? "Lou's Academy" : "Company$companyId Name",
      "logoUrl": "https://i.ibb.co/FzxBLZt/image.png",
      "description": "Company$companyId Description",
      "address": "Company$companyId Address",
      "email": "Company$companyId Email",
      "phone": "Company$companyId Phone",
      "website": "Company$companyId Website",
      "locations": [0, 1, 2],
      "industries": [0, 1, 2],
      "tech": [0, 1, 2],
      "socials": [0, 1, 3],
    });
  }
}
