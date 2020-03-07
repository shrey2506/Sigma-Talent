import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_pricing.dart';
import 'package:frontend/Screens/listing_review.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

class TitleScreen extends StatelessWidget {
  var titleController = TextEditingController();
  static const routeName = '/Title';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
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
                'Name Your Listing',
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
      floatingActionButton: SizedBox(
        height: height * 0.06,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Next'),
          textColor: Colors.white,
          onPressed: () {
            if (listingData.title == '' || listingData.title.length == 0) {
              print(listingData.title+'Hellllllllloooooooo');
              Fluttertoast.showToast(msg: 'Enter a title');
            } else {
              print(listingData.amenities);
              Navigator.of(context).pushNamed(PricingScreen.routeName);
            }
          },
          color: Color(0xFF00ad7c),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                'Attract guests with alisting title that highlights what makes your place special.',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: TextField(
              style: TextStyle(fontSize: 18),
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Add Title',
                border: InputBorder.none,
              ),
              onChanged: (val) {
                listingData.addTitleField(val);
              },
            ),
          )
        ],
      ),
    );
  }
}
