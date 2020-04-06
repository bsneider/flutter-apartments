import 'package:flutter/material.dart';
import 'package:flutter_apartments/api/mock_apartments.dart';
import 'package:flutter_apartments/ui_widgets/dropdown_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<MockApartmentsModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Country"),
            trailing: CustomDropdownButton(
              value: model.country,
              items: model.countryList,
              onChanged: model.setCountry,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Listing Type"),
            trailing: CustomDropdownButton(
              value: model.listingType,
              items: model.listingTypeList,
              onChanged: model.setListingType,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Sort"),
            trailing: CustomDropdownButton(
              value: model.sort,
              items: model.sortList,
              onChanged: model.setSort,
            ),
          ),
        ],
      ),
    );
  }
}
