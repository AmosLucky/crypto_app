import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';

Widget OpacityBg(BuildContext context, Widget body) {
  return Stack(
    children: [
      Container(
        width: getSize(context).width,
        height: getSize(context).height,

        // color: Colors.amber,
        child: Image.asset(
          GetAssts.getBgImage(),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: getSize(context).width,
        height: double.infinity,
        // height: Dimentions.getSize(context).height,
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0),
        ),
        child: body,
      )
    ],
  );
}
