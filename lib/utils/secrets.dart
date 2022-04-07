import 'dart:io' show Platform;

class Secret {
  // ignore: constant_identifier_names
  // static const ANDROID_CLIENT_ID =
  //     "583945496991-qvrqrld243omql533jjs2indron4ekql.apps.googleusercontent.com";
  static var ANDROID_CLIENT_ID =
      "583945496991-sqvjdl5g515qr6agkh2odusfn15a0q5h.apps.googleusercontent.com";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : "";
}
