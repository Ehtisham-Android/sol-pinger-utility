// import 'package:fifo_plus/presentation/pages/checkout_screen/greetings/place_order_greetings_screen.dart';
// import 'package:fifo_plus/presentation/pages/checkout_screen/step_1/step_1_cart_details_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../../navigation/navigation_menu.dart';
// import '../../presentation/pages/catalog_screen/catalog_screen.dart';
// import '../../presentation/pages/category_screen/category_screen.dart';
// import '../../presentation/pages/checkout_screen/step_2/step_2_cart_details_screen.dart';
// import '../../presentation/pages/city_and_language_selection_screen.dart';
// import '../../presentation/pages/home_screen/home_screen.dart';
// import '../../presentation/pages/map/choose_location_screen.dart';
// import '../../presentation/pages/order_details/order_details_screen.dart';
// import '../../presentation/pages/orders_screen/orders_screen.dart';
// import '../../presentation/pages/product_details/product_details_screen.dart';
// import '../../presentation/pages/registration_screen/register_success_message_screen.dart';
// import '../../presentation/pages/registration_screen/registration_step_1_screen.dart';
// import '../../presentation/pages/registration_screen/registration_step_2_screen.dart';
// import '../../presentation/pages/registration_screen/registration_step_3_screen.dart';
// import '../../presentation/pages/send_otp_screen/send_otp_screen.dart';
// import '../../presentation/pages/verify_otp_screen.dart';
//
// void goToCityAndLanguageSelectionScreen(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => CityAndLanguageSelectionScreen()),
//       (route) => false);
// }
//
// void goToSendOtpScreen(BuildContext context) {
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => const SendOtpScreen()));
// }
//
// void goToRegistrationStep1Screen(BuildContext context) {
//   Navigator.push(context,
//       MaterialPageRoute(builder: (context) => const RegistrationStep1Screen()));
// }
//
// void goToVerifyOtpScreen(
//     BuildContext context, String phoneNumber, OtpScreenCaller caller) {
//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => VerifyOtpScreen(caller, phoneNumber),
//   ));
// }
//
// void goToRegistrationStep2Screen(BuildContext context) {
//   Navigator.push(context,
//       MaterialPageRoute(builder: (context) => const RegistrationStep2Screen()));
// }
//
// void goToRegistrationStep3Screen(BuildContext context) {
//   Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (context) => const RegistrationStep3Screen()));
// }
//
// void goToRegisterSuccessMessageScreen(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//           builder: (context) => const RegisterSuccessMessageScreen()),
//       (route) => false);
// }
//
// void goToHomeScreen(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomeScreen(),
//       ),
//       (route) => false);
// }
//
// void goToCatalogScreen(BuildContext context, String catalogName, String catalogId, String catalogType) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CatalogScreen(catalogName, catalogId, catalogType),
//       ));
// }
//
// void goToCategoriesScreen(BuildContext context, String categoryId, String categoryName) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CategoryScreen(categoryId, categoryName),
//       ));
// }
//
// void goToOrderScreen(BuildContext context) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const OrdersScreen(),
//       ));
// }
//
// void goToOrderDetailsScreen(BuildContext context, String incrementId) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => OrderDetailsScreen(incrementId: incrementId),
//       ));
// }
//
// void goToProductDetailsScreen(BuildContext context, String productId) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProductDetailsScreen(productId),
//       ));
// }
//
// void goToNavigationScreen(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const NavigationMenu(),
//       ),
//       (route) => false);
// }
//
// void goToCheckoutStep2Screen(BuildContext context) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const CheckoutStep2Screen(),
//       ));
// }
//
// void goToPlaceOrderGreetingsScreen(BuildContext context) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const PlaceOrderGreetingsScreen(),
//       ));
// }
//
// void goToChooseLocationScreen(BuildContext context) {
//   Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const MapSample(),
//       ));
// }
