import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MockApartmentsModel extends ChangeNotifier {
  List<Property> _properties = [];
  bool _isLoading = false;
  String _statusText = "Start Search";
  int _totalResults;
  int _totalPages;
  bool _hasMorePages = true;
  String _placeName;
  bool _isLoadingMore = false;

  List<Map<String, String>> _listingTypeList = [
    {"name": "Buy", "value": "buy"},
    {"name": "Rent", "value": "rent"},
  ];
  String _listingType;
  List<Map<String, String>> _countryList = [
    {"name": "Brazil", "value": "br"},
    {"name": "France", "value": "fr"},
    {"name": "Germany", "value": "de"},
    {"name": "India", "value": "in"},
    {"name": "Italy", "value": "it"},
    {"name": "Mexico", "value": "mx"},
    {"name": "Spain", "value": "es"},
    {"name": "United Kingdom", "value": "uk"},
  ];
  String _country;
  List<Map<String, String>> _sortList = [
    {"name": "Relevancy", "value": "relevancy"},
    {"name": "Bedroom (Ascending)", "value": "bedroom_lowhigh"},
    {"name": "Bedroom (Descending)", "value": "bedroom_highlow"},
    {"name": "Price (Ascending)", "value": "price_lowhigh"},
    {"name": "Price (Descending)", "value": "price_highlow"},
    {"name": "Newest", "value": "newest"},
    {"name": "Oldest", "value": "oldest"},
    {"name": "Random", "value": "random"},
    {"name": "Distance", "value": "distance"}
  ];

  List<Property> get properties => [Property("prop1","summary1",10),Property("prop2","summary2",222)];

  bool get hasMorePages => null;

  bool get isLoadingMore => null; 
  }
  
  class Property {
    String title;
    String summary;
    double price;
    Property(title, summary, price);

  get listerName => null;

  String get priceFormatted => "1000";

  get bedroomNumber => 50;

  get bathroomNumber => 3;

  String get listerUrl => null;

  String get imgUrl => 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftenor.com%2Fview%2Frick-roll-rick-astley-never-gonna-give-you-up-gif-14189903&psig=AOvVaw2ZmNT58O4yBF_weNB63zxG&ust=1586575855370000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIC57eT13OgCFQAAAAAdAAAAABAD';

  get carSpaces => 1;

  get keyWordList => ["fresh","hot"];

  get datasourceName => "null";
}
