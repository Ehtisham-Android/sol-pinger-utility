import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showDecisionDialog(BuildContext context, String message,
    {String title = 'Error', String negativeBtnTxt = 'No', String positiveBtnTxt = 'Yes',
      required Function onPositivePressed}) {
  // set up the button
  Widget negativeButton = TextButton(
    child: Text(negativeBtnTxt),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  Widget positiveButton = TextButton(
    onPressed: (){
      onPositivePressed();
      Navigator.pop(context);
    },
    child: Text(positiveBtnTxt),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      negativeButton,
      positiveButton
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
