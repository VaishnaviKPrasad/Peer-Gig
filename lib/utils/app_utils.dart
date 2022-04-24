import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static String dateToDisplayFormat(DateTime date) =>
      "${date.day} ${date.month} ${date.year}";

  static List<String> getAllDisplayTimings() {
    List<String> displayTimings = [];
    for (var i = 1200; i <= 2400; i += 100) {
      String str = i.toString();
      str = str.substring(0, 2) + ':' + str.substring(2);
      displayTimings.add(str);
    }
    return displayTimings;
  }

  static void prompt(String url) async {
    try {
      await launch(url);
      //   print("########## From within prompt (url) : ${url}");
      //   await launch(url);
      //   if (await canLaunch(url)) {
      //     await launch(url);
      //   } else {
      //     throw 'Could not launch $url';
      // }
    } catch (e) {
      print(
          "########## From within prompt Google Calendar Api Error : ${e.toString()}");
    }
  }

  static String convertListToString(List<String> l) {
    String res = "";
    for (var str in l) {
      res += ("$str, ");
    }
    int len = res.length;
    res = res.substring(0, len - 2);
    print("##### List to string: $res");
    return res;
  }

  static String intTimeToDisplayStringTimeFormat(int time) {
    String str = time.toString();
    str = "${str.substring(0, 2)}:${str.substring(2)}";
    return str;
  }
}
