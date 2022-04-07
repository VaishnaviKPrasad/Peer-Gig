import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static String dateToDisplayFormat(DateTime date) =>
      "${date.day} ${date.month} ${date.year}";

  static void prompt(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
