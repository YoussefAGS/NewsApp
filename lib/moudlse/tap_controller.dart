import 'package:flutter/material.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/news-card.dart';
import 'package:news/models/tab-Item.dart';

import '../shared/network/remote/api_manager.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources = [];

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selected = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((source) => Tab(
                        child: TabItem(
                            source, widget.sources.indexOf(source) == selected),
                      ))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: ApiManager.getData(widget.sources[selected].id ?? ""),
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
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => NewsCard(news[index]),
                itemCount: news.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
