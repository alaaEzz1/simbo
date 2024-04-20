import 'package:flutter/material.dart';
import 'package:simbo/data/models/category_model.dart';
import 'package:simbo/presentation/utils/constants.dart';

List<CategoriesModel> categories = [
  CategoriesModel(
    title: "Workout Programs",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Exercise Types",
    image: "https://i.pinimg.com/564x/3f/87/d4/3f87d40040a276d00ac786e0a403b281.jpg",
  ),
  CategoriesModel(
    title: "Fitness Goals",
    image: "https://i.pinimg.com/564x/b5/f8/85/b5f8857a3c44567a93ef1a2507d3e616.jpg",
  ),
  CategoriesModel(
    title: "Specialized Programs",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Nutrition & Diet",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Equipment Focus",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Fitness Challenges & Events",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Health & Wellness",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Workout Tracking & Analytics",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
  CategoriesModel(
    title: "Community & Social Features",
    image: "https://i.pinimg.com/564x/b2/fe/bf/b2febf6d32bb938d46ab3418f9d36baf.jpg",
  ),
];

Widget categoryListWidget() {
  return SizedBox(
    width: double.infinity,
    height: 150,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.grey[200],
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shadowColor: appThemeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 5,
          child: SizedBox(
            width: 120,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  child: Image.network(
                    categories[position].image,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  categories[position].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: appThemeColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int position) {
        return Container(
          height: 2,
          color: Colors.grey,
        );
      },
      padding: EdgeInsets.all(8),
      itemCount: categories.length,
    ),
  );
}
