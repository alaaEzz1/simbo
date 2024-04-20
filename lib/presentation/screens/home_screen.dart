import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simbo/presentation/utils/constants.dart';
import 'package:simbo/presentation/widgets/home/category_list.dart';
import 'package:simbo/presentation/widgets/home/home_show_more.dart';
import 'package:simbo/presentation/widgets/home/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const homeRouteName = "home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        title: const Text("Home"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Column(
          children: [
            homeAutoSlider(),
            const SizedBox(
              height: 10,
            ),
            homeShowMore(title: "Categories"),
            categoryListWidget(),
            const SizedBox(
              height: 10,
            ),
            homeShowMore(title: "Best Activities"),

          ],
        ),
      ),
    );
  }
}
