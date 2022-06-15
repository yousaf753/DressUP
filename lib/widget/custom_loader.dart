import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant/colors.dart';

Widget customLoader() {
  return  SpinKitDualRing(
    size: 50.0,
    color: AppColors.buttonColor,
    lineWidth: 5,
  );
}