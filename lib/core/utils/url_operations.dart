import 'package:url_launcher/url_launcher.dart';

void easyLaunchUrl(String url) async {
  final Uri parsedUri = Uri.parse(url);

  await canLaunchUrl(parsedUri)
      ? await launchUrl(parsedUri, mode: LaunchMode.externalApplication)
      : throw 'Could not launch $url';
}
