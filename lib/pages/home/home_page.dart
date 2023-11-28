import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pancakes/pages/sample/first_page.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'app_bar.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);


  int _selectedIndex = 0;

  //late PersistentTabController _controller;

  List pages = [
    FirstPage(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      backgroundColor: (_selectedIndex == 0)
          ? AppColors.lightBackgroundColor
          : (_selectedIndex == 2) ? AppColors.lightBackgroundColor : Colors
          .white,
      appBar: variableAppBar(context, ref, false),
      body: pages[0],
    );
  }
}