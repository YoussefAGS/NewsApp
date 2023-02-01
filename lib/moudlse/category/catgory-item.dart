import 'package:flutter/material.dart';
import 'package:news/models/category-data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int indsx;

  CategoryItem(this.categoryData, this.indsx);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft:
                  (indsx % 2 == 0) ? Radius.circular(25) : Radius.circular(0),
              bottomRight:
                  (indsx % 2 == 1) ? Radius.circular(25) : Radius.circular(0))),
      child: Column(
        children: [
          Image.asset(categoryData.image,height: 110,),
          Expanded(child: Center(child:
          Text(
              categoryData.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
            ),
          )
          )
          )
        ],
      ),
    );
  }
}
