import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/moudlse/tap_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

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
        appBar: AppBar(elevation: 0.0,
          title: Text('News'),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
              )
          ),
        ),
        body: FutureBuilder<SourcesResponse>(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.data?.message ?? "");
            }
            if (snapshot.data?.status != 'ok') {
              return Center(child: Text("${snapshot.data!.message!}"));
            }
            var sources = snapshot.data?.sources ?? [];

            return TabControllerScreen(sources);
          },
        ),
      ),
    );
  }
}
