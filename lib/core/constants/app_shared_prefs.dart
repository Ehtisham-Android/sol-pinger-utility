import 'package:sol_pinger_utility/core/constants/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static AppSharedPref? _instance;
  static late SharedPreferences _preferences;

  AppSharedPref._();

  static Future<AppSharedPref> getSharedPrefs() async {
    _instance ??= AppSharedPref._();
    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  dynamic _getData(String key) {
    return _preferences.get(key);
  }

  dynamic _setData(String key, dynamic value) {
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }

  int get scheduleInterval => _getData(SharedPrefsKeys.SCHEDULE_INTERVAL) ?? 1;

  set scheduleInterval(int value) => _setData(SharedPrefsKeys.SCHEDULE_INTERVAL, value);


  String get fcmToken => _getData(SharedPrefsKeys.FCM_TOKEN) ?? '';

  set fcmToken(String value) => _setData(SharedPrefsKeys.FCM_TOKEN, value);

  String get currency => _getData(SharedPrefsKeys.DEFAULT_CURRENCY) ?? 'SAR';

  set currency(String value) => _setData(SharedPrefsKeys.DEFAULT_CURRENCY, value);

  String get quoteId => _getData(SharedPrefsKeys.QUOTE_ID) ?? '0';

  set quoteId(String value) => _setData(SharedPrefsKeys.QUOTE_ID, value);

  String get customerMobileNumber =>
      _getData(SharedPrefsKeys.CUSTOMER_MOBILE_NUMBER) ?? '';

  set customerMobileNumber(String value) =>
      _setData(SharedPrefsKeys.CUSTOMER_MOBILE_NUMBER, value);

  String get kommunicateHook =>
      _getData(SharedPrefsKeys.KOMMUNICATE_HOOK) ?? '';

  set kommunicateHook(String value) =>
      _setData(SharedPrefsKeys.KOMMUNICATE_HOOK, value);

  String get customerId => _getData(SharedPrefsKeys.CUSTOMER_ID) ?? '';

  set customerId(String value) => _setData(SharedPrefsKeys.CUSTOMER_ID, value);

  String get customerToken => _getData(SharedPrefsKeys.CUSTOMER_TOKEN) ?? '';

  set customerToken(String value) =>
      _setData(SharedPrefsKeys.CUSTOMER_TOKEN, value);

  String get bearerToken => _getData(SharedPrefsKeys.BEARER_TOKEN) ?? '';

  set bearerToken(String value) =>
      _setData(SharedPrefsKeys.BEARER_TOKEN, value);

  bool get isApprove => _getData(SharedPrefsKeys.IS_APPROVE) ?? false;

  set isApprove(bool value) =>
      _setData(SharedPrefsKeys.IS_APPROVE, value);

  String get selectedLanguage =>
      _getData(SharedPrefsKeys.SELECTED_LANGUAGE) ?? 'en';

  set selectedLanguage(String value) =>
      _setData(SharedPrefsKeys.SELECTED_LANGUAGE, value);

  String get storeId => _getData(SharedPrefsKeys.STORE_ID) ?? '1';

  set storeId(String value) => _setData(SharedPrefsKeys.STORE_ID, value);

  String get storeCode => _getData(SharedPrefsKeys.STORE_CODE) ?? 'jed_en';

  set storeCode(String value) => _setData(SharedPrefsKeys.STORE_CODE, value);

  String get websiteId => _getData(SharedPrefsKeys.WEBSITE_ID) ?? '';

  set websiteId(String value) => _setData(SharedPrefsKeys.WEBSITE_ID, value);

  String get websiteCode => _getData(SharedPrefsKeys.WEBSITE_CODE) ?? '';

  set websiteCode(String value) =>
      _setData(SharedPrefsKeys.WEBSITE_CODE, value);

  String get websiteName => _getData(SharedPrefsKeys.WEBSITE_NAME) ?? '';

  set websiteName(String value) =>
      _setData(SharedPrefsKeys.WEBSITE_NAME, value);

  String get websiteNameAr => _getData(SharedPrefsKeys.WEBSITE_NAME_AR) ?? '';

  set websiteNameAr(String value) =>
      _setData(SharedPrefsKeys.WEBSITE_NAME_AR, value);

  String get companyName => _getData(SharedPrefsKeys.COMPANY_NAME) ?? '';

  set companyName(String value) =>
      _setData(SharedPrefsKeys.COMPANY_NAME, value);

  String get restaurantName => _getData(SharedPrefsKeys.RESTAURANT_NAME) ?? '';

  set restaurantName(String value) =>
      _setData(SharedPrefsKeys.RESTAURANT_NAME, value);

  String get contactPerson => _getData(SharedPrefsKeys.CONTACT_PERSON) ?? '';

  set contactPerson(String value) =>
      _setData(SharedPrefsKeys.CONTACT_PERSON, value);

  String get customerEmail => _getData(SharedPrefsKeys.CUSTOMER_EMAIL) ?? '';

  set customerEmail(String value) =>
      _setData(SharedPrefsKeys.CUSTOMER_EMAIL, value);

  String get customerLastSelectedAddress => _getData(SharedPrefsKeys.CUSTOMER_LAST_SELECTED_ADDRESS) ?? '';

  set customerLastSelectedAddress(String value) =>
      _setData(SharedPrefsKeys.CUSTOMER_LAST_SELECTED_ADDRESS, value);

  String get customerLastSelectedPaymentMethod => _getData(SharedPrefsKeys.CUSTOMER_LAST_SELECTED_PAYMENT_METHOD) ?? '';

  set customerLastSelectedPaymentMethod(String value) =>
      _setData(SharedPrefsKeys.CUSTOMER_LAST_SELECTED_PAYMENT_METHOD, value);

  void saveRegistrationStep1Details(String companyName, String restaurantName,
      String contactPerson, String customerEmail) {
    this.companyName = companyName;
    this.restaurantName = restaurantName;
    this.contactPerson = contactPerson;
    this.customerEmail = customerEmail;
  }

  void saveRegistrationStep2Details(String customerMobileNumber) {
    this.customerMobileNumber = customerMobileNumber;
  }

  void saveCustomerSessionDetails(
      String? customerId, String? customerToken, String? bearerToken) {
    this.customerId = customerId ?? '';
    this.customerToken = customerToken ?? '';
    this.bearerToken = bearerToken ?? '';
  }
}
