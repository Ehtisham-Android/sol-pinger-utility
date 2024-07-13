// import 'package:fifo_plus/presentation/widgets/helper_widgets/snack_bar.dart';
// import 'package:file_picker_pro/file_data.dart';
// import 'package:file_picker_pro/file_picker.dart';
// import 'package:file_picker_pro/files.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// import '../../../core/AppGlobals.dart';
// import '../../../core/constants/constants.dart';
//
// Widget openFilePicker(BuildContext context, Rx<FileData> fileDataObs) {
//   return FilePicker(
//     context: context,
//     height: 50,
//     fileData: fileDataObs.value,
//     crop: false,
//     maxFileSizeInMb: 1,
//     allowedExtensions: const [Files.png, Files.jpg, Files.pdf],
//     onSelected: (fileData) {
//       fileDataObs.value = fileData;
//     },
//     onCancel: (message, messageCode) {
//       showSnackBar(context, '[$messageCode] $message');
//     },
//     child: Container(
//       height: Dimens.btnHeightMedium,
//       width: 130,
//       decoration: const BoxDecoration(
//           color: AppColors.paleOrange,
//           borderRadius: BorderRadius.all(Radius.circular(12))),
//       child: Center(child: Text(AppLocalizations.of(context).choose_file)),
//     ),
//   );
// }