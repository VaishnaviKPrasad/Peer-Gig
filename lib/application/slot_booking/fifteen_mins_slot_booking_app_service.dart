import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:peer_gig/utils/secrets.dart';

class FifteenMinsSlotBookingAppService {
  Future<void> bookAFifteenMinsSlot() async {
    print("###### Secret ACCESS TOKEN : ${Secret.ACCESS_TOKEN}");
    final smptServer = gmailSaslXoauth2(
        "btbtc19186_sargam@banasthali.in", Secret.ACCESS_TOKEN);
    final message = Message()
      ..subject = "Peer Gig"
      ..text = "15 mins slot booking"
      ..recipients = [
        'btbtc19297_samridhi@banasthali.in',
        'vaishnavikprasad@gmail.com'
      ]
      ..from = Address("btbtc19186_sargam@banasthali.in");

    try {
      await send(message, smptServer);
      print("###### Sent successfully!!!");
    } catch (e) {
      print("########## Mailer Error: ${e.toString()}");
    }
  }
}
