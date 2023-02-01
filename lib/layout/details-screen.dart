import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static const String routename = 'ArticleDetailsScreen';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    Articles articles = ModalRoute.of(context)!.settings.arguments as Articles;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .15,
          elevation: 0.0,
          title: Text('News'),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CachedNetworkImage(
                  imageUrl:  articles.urlToImage??"",
                  height: height*0.25,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Colors.green,)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Text(
                  articles.source!.name!,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  articles.title ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  articles.publishedAt?.substring(0,10) ?? "",
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 20,),
                Text(
                  articles.description ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    launchUrl(Uri.parse(articles.url!));

                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'view this artical',
                        style: const TextStyle(
                    fontSize: 14,
                  ),
                      ),
                      Icon(Icons.arrow_right,size: 20,color: Colors.black,)
                    ],
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
