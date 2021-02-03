import 'package:flutter/material.dart';
import 'package:tomato_owl/api/approve_phone/approve_phone.dart';
import 'package:tomato_owl/api/approve_phone/networks/get_approve_phone.dart';
import 'package:tomato_owl/api/base_model.dart';

class ApprovePhoneNotifier with ChangeNotifier {
  ApprovePhone response;

  void approvePhone(String phone, String code) async {
    BaseModel baseModel = await GetApprovePhone().getData([phone, code]);

    response = baseModel.data;
    if (response != null) {
      notifyListeners();
    }
  }
}
