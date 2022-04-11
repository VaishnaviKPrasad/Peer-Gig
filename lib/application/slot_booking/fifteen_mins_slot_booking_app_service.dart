import 'package:googleapis/calendar/v3.dart';

class FifteenMinsSlotBookingAppService {
  void bookAFifteenMinsSlot() {
    Event event = Event(); // Create object of event
    event.summary =
        "Meet regarding internships/placements"; //Setting summary of object

    EventDateTime start = EventDateTime(); //Setting start time
    start.dateTime = DateTime(2022, 5, 21, 17, 30);
    start.timeZone = "GMT+05:00";
    event.start = start;

    EventDateTime end = EventDateTime(); //setting end time
    end.timeZone = "GMT+05:00";
    end.dateTime = DateTime(2022, 5, 21, 17, 45);
    event.end = end;
  }
}
