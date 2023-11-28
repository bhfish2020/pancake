import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

AppBar variableAppBar(BuildContext context, WidgetRef ref, bool isPopped) {
  return AppBar(
    leading: GestureDetector(
      onTap: (){
        if(isPopped){
          context.pop();
          //TODO: make button go places
        }

      },
      child: isPopped?AppIcon(
        icon:Icons.arrow_back_ios,
        iconSize: Dimensions.iconSize24 * 1.5,
        backgroundColor: Colors.transparent,
        iconColor: AppColors.textColor,
      ):null,
    ),


    shadowColor: Colors.transparent,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: BigText(
      text: "Brannon Industrial Controls Project",
      color: AppColors.mainColor,
      size: Dimensions.font20,
      fontWeight: FontWeight.w800,
    ),
  );
}
