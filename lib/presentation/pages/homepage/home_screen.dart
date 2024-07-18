import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sol_pinger_utility/presentation/Pages/widgets/helper_widgets/loading_indicator.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_event.dart';
import 'package:sol_pinger_utility/presentation/bloc/homepage/homepage_state.dart';
import 'package:sol_pinger_utility/presentation/pages/homepage/urls_list.dart';
import '../../../core/AppGlobals.dart';
import '../../../core/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialSurfaceColor(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context){
    context.read<HomePageBloc>().add(const GetUrlsList());

    return BlocBuilder<HomePageBloc, HomePageState>(
        builder: (BuildContext context, state) {
          if (state is OnHomePageLoading) {
            return const LoadingIndicator();
          }

          if (state is OnHomePageSuccess) {
            final urlList = state.result;
            return SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(Dimens.screenPadding),
                    child: UrlsList(urlList))
            );
          }

          return Container();
        }
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   HomeScreenState createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   PingData? _lastPing;
//   final TextEditingController _controller =
//   TextEditingController(text: '');
//   List<UrlEntity> urlsList = [];
//   final database = locator<DatabaseHelper>();
//
//   void _startPing() {
//     // Create instance of DartPing
//     final ping = Ping(_controller.text, count: 3);
//     print('Running command: ${ping.command}');
//     ping.stream.listen((event) {
//       setState(() {
//         _lastPing = event;
//       });
//     });
//   }
//
//   void _getAllUrlsFromDB() async {
//     var urls = await database.getUrlsMapList();
//     for (int index = 0; index < urls.length; index++) {
//       urlsList.add(UrlEntity.fromJson(urls[index]));
//     }
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //_getAllUrlsFromDB();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: textOrangeXLarge('Sol Pinger Utility', bold: true),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: Dimens.spaceLarge),
//                   color: AppColors.beigeColor(context),
//                   height:
//                   CategoriesItemHeight.subCategoryHeight,
//                   child: UrlsList(urlsList)),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(24.0),
//             //   child: TextFormField(
//             //     controller: _controller,
//             //     keyboardType: TextInputType.url,
//             //     maxLength: 200,
//             //     //onChanged: onChanged,
//             //     textAlign: TextAlign.center,
//             //     decoration: InputDecoration(
//             //         contentPadding: const EdgeInsets.symmetric(
//             //             horizontal: Dimens.textFieldContentPadding),
//             //         constraints: BoxConstraints.tight(
//             //             const Size.fromHeight(Dimens.textFieldHeight)),
//             //         filled: true,
//             //         fillColor: AppColors.white,
//             //         border: OutlineInputBorder(
//             //             borderSide: BorderSide.none,
//             //             borderRadius: BorderRadius.circular(Dimens.radiusXXXLarge)),
//             //         hintText: 'Please type url to ping ...',
//             //         hintStyle: const TextStyle(color: AppColors.hintTextColor)),
//             //   ),
//             // ),
//             // textGreyLarge(
//             //   maxLines: 3,
//             //   _lastPing?.toString() ?? '',
//             // ),
//             // vSpaceLarge(),
//             // Center(
//             //   child: TurquoiseButton(text: 'Ping', onPressed: _startPing),
//             // ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _startPing,
//       //   tooltip: 'Start Ping',
//       //   child: const Icon(Icons.radar_sharp),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }