import 'package:flutter/material.dart';
import 'package:frontend/DummyData/dummyData.dart';

class ListingHomeScreen extends StatelessWidget {
  static const routeName = '/listing_home_screen';
  @override
  Widget build(BuildContext context) {
    var completedHeadders = completedFields;
    var headders = [
      'Property',
      'Location',
      'Amenities',
      'Add Photos',
      'Title',
      'Pricing',
      'Review'
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var appBar = PreferredSize(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Color(0xFF00ad7c),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.white,
            ),
            Text(
              'Lets setup your Listings..',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      preferredSize: MediaQuery.of(context).size * 0.16,
    );
    return Scaffold(
      // body: ,
      appBar: appBar,
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: height -
            MediaQuery.of(context).padding.vertical -
            appBar.preferredSize.height,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  onTap: () =>
                      Navigator.of(context).pushNamed('/' + headders[index]),
                  title: Text(headders[index]),
                  // dense: true,
                  trailing: completedHeadders.contains(headders[index])
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : SizedBox(),
                ),
                Divider(),
              ],
            );
          },
          itemCount: headders.length,
        ),
      ),
    );
  }
}
