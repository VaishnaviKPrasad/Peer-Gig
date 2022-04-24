import 'package:peer_gig/data/slot_booking/mock_interview_slot_info_repository.dart';

class MockInterviewSlotInfoAppService {
  static Future<Map<String, String>> getMockInterviewSlotInfo(
      String userId) async {
    final _mockInterviewSlotInfoRepo = MockInterviewSlotInfoRepository();
    final _days = await _mockInterviewSlotInfoRepo.getDays(userId);

    var _startTime =
        (await _mockInterviewSlotInfoRepo.getStartTime(userId)).toString();
    _startTime = _startTime.substring(0, 2) + ":" + _startTime.substring(2);

    var _endTime =
        (await _mockInterviewSlotInfoRepo.getEndTime(userId)).toString();
    _endTime = _endTime.substring(0, 2) + ":" + _endTime.substring(2);

    Map<String, String> slotDetails = {
      'days': _days,
      'startTime': _startTime,
      'endTime': _endTime
    };

    return slotDetails;
  }
}
