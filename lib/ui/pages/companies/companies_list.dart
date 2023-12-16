import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internup/controllers/companies_list_controller.dart';
import 'package:internup/data/models/company.dart';
import 'package:internup/ui/widgets/company_card.dart';
import 'package:internup/ui/widgets/search_bar.dart';

class CompaniesList extends StatelessWidget {
  const CompaniesList({super.key});

  @override
  Widget build(BuildContext context) {
    CompaniesListController companyListController = Get.find<CompaniesListController>();
    return Column(
      children: [
        MySearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Obx(() => Column(children: [
                  for (Company company in companyListController.companiesList)
                    MyCompanyCard(company)
                ])),
          ),
        ),
      ],
    );
  }
}
