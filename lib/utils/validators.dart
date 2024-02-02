class Validators {
  static final RegExp _mobileNumberExp = RegExp(r'[6-9][0-9]{9}');

  static isValidMobileNo(String mobileNo) {
    return _mobileNumberExp.hasMatch(mobileNo);
  }
}
