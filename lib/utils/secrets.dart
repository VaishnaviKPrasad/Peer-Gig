import 'dart:io' show Platform;

class Secret {
  // ignore: constant_identifier_names
  static var ANDROID_CLIENT_ID =
      "583945496991-qvrqrld243omql533jjs2indron4ekql.apps.googleusercontent.com";
  // static var ANDROID_CLIENT_ID =
  //     "583945496991-sqvjdl5g515qr6agkh2odusfn15a0q5h.apps.googleusercontent.com";
  // static var ANDROID_CLIENT_ID;
  static var CLIENT_SECRET = "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";
  static var ACCESS_TOKEN;
  static String getId() => Platform.isAndroid ? ANDROID_CLIENT_ID : "";
  static String getClientSecret() => Secret.CLIENT_SECRET;
}
