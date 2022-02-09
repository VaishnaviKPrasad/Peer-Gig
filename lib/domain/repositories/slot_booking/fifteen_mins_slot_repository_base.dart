import 'package:flutter/foundation.dart';
import '../../entities/slot_booking/fifteen_mins_slot.dart';

abstract class FifteenMinsSlotRepositoryBase {
  Future<void> addFifteenMinsSlot(
      {@required String userId, @required FifteenMinsSlot slot});
  Future<void> deleteFifteenMinsSlot(
      {@required String userId, @required FifteenMinsSlot slot});
}
