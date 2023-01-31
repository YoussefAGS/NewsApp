
import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';

class TabItem extends StatelessWidget {
Sources sourceName;
bool isSelected;
TabItem(this.sourceName,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        sourceName.name??"",
        style: TextStyle(
          color: isSelected?Colors.white:Colors.green,

        ),
      ),
    );
  }
}
