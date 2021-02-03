import 'package:flutter/material.dart';
import 'package:tomato_owl/api/base_model.dart';
import 'package:tomato_owl/api/register_phone/networks/get_register_phone.dart';
import 'package:tomato_owl/api/register_phone/register_phone.dart';

class RegisterPhoneNotifier with ChangeNotifier {
  RegisterPhone response;

  void registerPhone(String phone) async {
    BaseModel baseModel = await GetRegisterPhone().getData(phone);

    response = baseModel.data;
    if (response != null) {
      notifyListeners();
    }
  }
}