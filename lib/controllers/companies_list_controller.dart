import 'package:get/get.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/data/repositories/comapnies.dart';

class CompaniesListController extends GetxController {
  final CompaniesRepository _companiesRepository;

  CompaniesListController(this._companiesRepository);

  RxList<Company> companiesList = <Company>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  void getCompanies() async {
    List<Company> companies = await _companiesRepository.getCompanies();

    companiesList.assignAll(companies);
  }

  Future<Company> getFullCompanyDetails(companyId) async {
    Company company = await _companiesRepository.getCompany(companyId);
    return company;
  }
  
  String companyName(int companyId) {
    try {
      return companiesList.firstWhere((element) => element.id == companyId).name;
    } catch (e) {
      return "Unknown Company";
    }
  }
  String companyAddress(int companyId) {
    try {
      return companiesList.firstWhere((element) => element.id == companyId).address ?? "Unknown Address";
    } catch (e) {
      return "Unknown Address";
    }
  }

  Company? companyById(int companyId) {
    try {
      return companiesList.firstWhere((element) => element.id == companyId);
    } catch (e) {
      return null;
    }
  }

}
