import 'package:flutter/foundation.dart';

class Validation extends ChangeNotifier{
  bool? isNameValid;
  bool? isBillingAddressValid;
  bool? isDeliveryAddressValid;
  bool? isPhoneValid;

  bool get getIsNameEmpty => isNameValid!;
  bool get getIsBillingAddressEmpty => isBillingAddressValid!;
  bool get getIsDeliveryAddressEmpty => isDeliveryAddressValid!;
  bool get getIsPhoneEmpty => isPhoneValid!;

  checkNameValid(String text){
    if(text.isNotEmpty)
      {
        isNameValid = true;
      }
    else{
      isNameValid = false;
    }
    notifyListeners();

  }
  checkBillingAddressValid(String text){
    if(text.isNotEmpty)
    {
      isBillingAddressValid = true;
      notifyListeners();
    }
  }
  checkDeliveryAddressValid(String text){
    if(text.isNotEmpty)
    {
      isDeliveryAddressValid = true;
      notifyListeners();
    }
  }
  checkPhoneValid(String text){
    if(text.isEmpty)
    {
      isPhoneValid = false;
    }
    else if(text.length!=10)
      {
        isPhoneValid = false;
      }
    // ignore: unrelated_type_equality_checks
    else if(int.tryParse(text)==false)
      {
        isPhoneValid = false;
      }
    else{
      isPhoneValid = true;
    }
  }

}