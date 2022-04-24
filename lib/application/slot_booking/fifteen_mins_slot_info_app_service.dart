import 'package:peer_gig/data/slot_booking/fifteen_mins_slot_info_repository.dart';

class FifteenMinsSlotInfoAppService {
  static Future<Map<String, String>> getFifteenMinsSlotInfo(
      String userId) async {
    final _fifteenMinsSlotInfoRepo = FifteenMinsSlotInfoRepository();
    final _days = await _fifteenMinsSlotInfoRepo.getDays(userId);

    var _startTime =
        (await _fifteenMinsSlotInfoRepo.getStartTime(userId)).toString();
    _startTime = _startTime.substring(0, 2) + ":" + _startTime.substring(2);

    var _endTime =
        (await _fifteenMinsSlotInfoRepo.getEndTime(userId)).toString();
    _endTime = _endTime.substring(0, 2) + ":" + _endTime.substring(2);

    Map<String, String> slotDetails = {
      'days': _days,
      'startTime': _startTime,
      'endTime': _endTime
    };

    return slotDetails;
  }
}
