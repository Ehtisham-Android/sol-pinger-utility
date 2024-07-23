import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool validatePhoneNumber(String phoneNumber) {
  return phoneNumber.length == 10 && phoneNumber.startsWith('05');
}

bool validateEmailAddress(String email) {
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegex.hasMatch(email);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenHeightWithPercentage(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

int totalPages(int totalCount, int pageSize) {
  return (totalCount / pageSize).ceil();
}

String formatUrl(String url){
  var result = url;

  result = result.removeAllWhitespace;
  //result = result.replaceAll(RegExp(r'http://'), '');
  //result = result.replaceAll(RegExp(r'https://'), '');
  result = result.replaceAll(RegExp(r'www.'), '');

  return result;
}

bool validateUrl(String email) {
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegex.hasMatch(email);
}
