import '../ui/pages/companies/companies_list.dart';
import 'package:internup/ui/pages/bookmarks/bookmarks_list.dart';
import 'package:internup/ui/pages/info/info_page.dart';
import 'package:internup/ui/pages/offers/offers_list.dart';
import 'package:unicons/unicons.dart';

final List<Map<String, Object>> pages = [
  {"name": "Companies", "icon": UniconsLine.building, "page": const CompaniesList()},
  {"name": "Offers", "icon": UniconsLine.tag_alt, "page": const OffersList()},
  {"name": "Bookmarks", "icon": UniconsLine.bookmark, "page": const BookmarksList()},
  {"name": "Info", "icon": UniconsLine.ellipsis_h, "page": const InfoPage()},
];
