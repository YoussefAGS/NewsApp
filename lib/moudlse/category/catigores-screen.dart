import 'package:flutter/material.dart';
import 'package:news/models/category-data.dart';
import 'package:news/moudlse/category/catgory-item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routname="CategoriesScreen";
  Function selectedCategory;

  CategoriesScreen(this.selectedCategory);

  var category = CategoryData.getCategory();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Pick your category of intersted',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){selectedCategory(category[index]);},
                        child: CategoryItem(category[index], index))
            ),
          )
        ],
      ),
    );
  }
}
