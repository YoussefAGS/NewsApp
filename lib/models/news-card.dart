import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(

      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl:  articles.urlToImage??"",
            height: height*0.25,
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.green,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(
            articles.author ?? "",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Text(
            articles.title ?? "",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            articles.publishedAt?.substring(0,10) ?? "",
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
