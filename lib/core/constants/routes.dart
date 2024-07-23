import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/home_screen.dart';


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

void goToHomePage(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
}
