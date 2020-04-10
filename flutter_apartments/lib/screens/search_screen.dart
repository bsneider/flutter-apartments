import 'package:flutter/material.dart';
import 'package:flutter_apartments/api/mock_apartments.dart';
import 'package:flutter_apartments/ui_widgets/search.dart';
import 'package:flutter_apartments/screens/detail_screen.dart';
import 'package:flutter_apartments/ui_widgets/property_item.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  ScrollController controller;
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _scrollListener() {
    var props = Provider.of<MockApartmentsModel>(context);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print("Reached end");
      if (!props.isLoadingMore && props.hasMorePages) {
        page++;
        print("UI page: $page");
        props.properties;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MockApartmentsModel>(context);
    return Scaffold(
      body: CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                title: SearchWidget(
                  performSearch: model.properties,
                ),
                floating: true,
                snap: true,
              ),
            ],
          )
          );
  }
}
