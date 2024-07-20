import 'package:flutter/material.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/text_styles.dart';

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
    content: textSecondaryDarkMedium(message, maxLines: 3),
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
