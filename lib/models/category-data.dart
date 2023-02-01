import 'package:flutter/material.dart';

class CategoryData{
  String id,title,image;
  Color color;


   CategoryData(this.id, this.title, this.image, this.color);
  static List<CategoryData>getCategory(){
    return[
      CategoryData('sports', 'Sports', 'assets/image/sports.png', Color(0xFFC91C22)),
      CategoryData('business', 'bussines', 'assets/image/bussines.png', Color(0xFFCF7E48)),
      CategoryData('entertainment', 'Politics', 'assets/image/Politics.png', Color(0xFF003E90)),
      CategoryData('general', 'environment', 'assets/image/environment.png', Color(0xFF4882CF)),
      CategoryData('health', 'Health', 'assets/image/health.png', Color(0xFFED1E79)),
      CategoryData('science', 'science', 'assets/image/science.png', Color(0xFFF2D352)),
      CategoryData('technology', 'technology', 'assets/image/science.png', Color(0xFFF2D352)),



    ];
  }
}