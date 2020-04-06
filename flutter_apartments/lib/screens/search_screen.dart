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
        props.getProperties(props.placeName, page);
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
                  performSearch: model.getProperties,
                ),
                floating: true,
                snap: true,
              ),
              model.isLoading
                  ? SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : model.getPropertyCount() < 1
                      ? SliverFillRemaining(
                          child: Center(
                            child: Text(
                              model.statusText,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
//                              print("Index: $index");
                              if (index == model.getPropertyCount() + 1) {
                                if (model.hasMorePages) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return Container();
                              } else if (index == 0) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[300]))),
                                  child: Text(
                                    "${model.totalResults} results",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: Colors.grey[600]),
                                  ),
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                    InkWell(
                                      child: PropertyItem(
                                          model.properties[index - 1]),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(model.properties[index - 1])),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                            childCount: model.getPropertyCount() + 2,
                          ),
                        )
            ],
          )
          );
  }
}
