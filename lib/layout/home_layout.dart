import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/category-data.dart';
import 'package:news/moudlse/category/catigores-screen.dart';
import 'package:news/moudlse/drawer-screen.dart';
import 'package:news/moudlse/home-screen.dart';
import 'package:news/moudlse/cotroller/tap_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/NewsDataModel.dart';
import '../moudlse/news-card.dart';

class HomeLayout extends StatefulWidget {
  static const String routName = 'HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: MediaQuery
              .of(context)
              .size
              .height * .15,
          elevation: 0.0,
          title: Center(child: Text('News', textAlign: TextAlign.center,)),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
          actions: [
            categoryData == null ? Container() : Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate:NewsSearch());
                  },
                  icon: Icon(Icons.search, size: 30, color: Colors.white,)),
            )
          ],
        ),
        drawer: DrawerScreen(onselectedDrawer),
        body: categoryData == null
            ? CategoriesScreen(onselectedCategory)
            : HomeScreen(categoryData!),
      ),
    );
  }

  CategoryData? categoryData = null;

  void onselectedDrawer(number) {
    if (number == 1) {
      categoryData = null;
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onselectedCategory(selectedCategory) {
    categoryData = selectedCategory;
    setState(() {

    });
  }
}

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        showResults(context);
      }, icon: Icon(Icons.search, size: 30,)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.close, size: 30,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsDataModel>(
      future: ApiManager.getData(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ));
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "has Error"),
              TextButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "has Error"),
              TextButton(onPressed: () {}, child: Text('Try Again'))
            ],
          );
        }
        var news = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => NewsCard(news[index]),
          itemCount: news.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('search');
  }

}
