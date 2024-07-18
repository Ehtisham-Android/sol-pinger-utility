import 'package:flutter/cupertino.dart';
import '../../../../core/AppGlobals.dart';
import '../../../../core/Utils.dart';
import 'bg_curved_edges.dart';

class FCurvedEdgesWidget extends StatelessWidget {

  final Widget? child;

  const FCurvedEdgesWidget({
    this.child, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BGCurvedEdges(),
      child: Container(
        color: AppColors.homeColor(context),
        child: SizedBox(
          height: 280,
          width: getScreenWidth(context),
          child: Stack(
            children: [
              child ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}