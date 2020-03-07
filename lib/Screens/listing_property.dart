import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_location.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

class PropertyScreen extends StatelessWidget {
  static const routeName = '/Property';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
    var selectedType =
        listingData.propertyType ?? 'what kind of property u want to List?';
    var appBar = PreferredSize(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
              // color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Tell us about your place',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      preferredSize: MediaQuery.of(context).size * 0.16,
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        width: width - MediaQuery.of(context).padding.horizontal,
        height: height - MediaQuery.of(context).padding.vertical,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: width * 0.1,
              top: 20,
              child: Container(
                width: width * 0.8,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: ExpansionTile(
                    key: GlobalKey(),
                    children: <Widget>[
                      ListTile(
                        title: Text('Co- Living'),
                        onTap: () => listingData.addPropertyField('Co- Living'),
                      ),
                      ListTile(
                        title: Text('Co- Working'),
                        onTap: () =>
                            listingData.addPropertyField('Co- Working'),
                      ),
                      ListTile(
                        title: Text('Down Studio'),
                        onTap: () =>
                            listingData.addPropertyField('Down Studio'),
                      ),
                      ListTile(
                        title: Text('Fitness GYM'),
                        onTap: () =>
                            listingData.addPropertyField('Fitness GYM'),
                      )
                    ],
                    title: Text(selectedType),
                    subtitle: (selectedType ==
                            'what kind of property u want to List?')
                        ? Text('Select Property Type')
                        : SizedBox(
                            height: 0,
                          ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: SizedBox(
                height: height * 0.06,
                child: RaisedButton(
                  child: Text('Next'),
                  onPressed: () {
                    if (listingData.propertyType != null) {
                      Navigator.of(context).pushNamed(LocationScreen.routeName);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please Select Property Type');
                    }
                  },
                  color: Color(0xFF00ad7c),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
