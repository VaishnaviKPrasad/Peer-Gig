import 'package:flutter/foundation.dart';

import '../../entities/slot_booking/mock_interview_slot.dart';

abstract class MockInterviewSlotRepositoryBase {
  Future<void> addFifteenMinsSlot(
      {@required String userId, @required MockInterviewSlot slot});
  Future<void> deleteFifteenMinsSlot(
      {@required String userId, @required MockInterviewSlot slot});
}
