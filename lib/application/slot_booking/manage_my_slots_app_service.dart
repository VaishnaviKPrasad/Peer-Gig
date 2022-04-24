import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/data/slot_booking/fifteen_mins_slot_info_repository.dart';

import '../../data/slot_booking/mock_interview_slot_info_repository.dart';

class ManageMySlotsAppService {
  static void saveSlotInfo(Map<String, Object> fifteenMinsSlotInfoMap,
      Map<String, Object> mockInterviewSlotInfoMap) {
    String? userId = AuthAppService().getEmailOfUser();
    FifteenMinsSlotInfoRepository().addSlotDetails(
        userId: userId, appointmentDetails: fifteenMinsSlotInfoMap);

    MockInterviewSlotInfoRepository().addSlotDetails(
        userId: userId, appointmentDetails: mockInterviewSlotInfoMap);

    print("##### Slot Info Added");
  }
}
