import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/add_photos_for_listing.dart';
import 'package:frontend/Screens/listing_title.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

class AddPhotosScreen extends StatelessWidget {
  static const routeName = '/Add Photos';

  @override
  Widget build(BuildContext context) {
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
                'Add Photos to your listing',
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
    var listingData = Provider.of<ListingProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SizedBox(
        height: height * 0.06,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Skip for Now'),
          textColor: Colors.white,
          onPressed: () {
            // if (listingData.amenities == null ||
            //     listingData.amenities.length == 0) {
            //   Fluttertoast.showToast(
            //       msg: 'Please Select ameninities your place has');
            // } else {
            print(listingData.amenities);
            Navigator.of(context).pushNamed(TitleScreen.routeName);
            // }
          },
          color: Color(0xFF00ad7c),
        ),
      ),
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: width * 0.8,
              child: Text(
                'Photos help guest imagine staying in your place. You can start with one and add more after you publish.',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.2, top: 50),
            height: height * 0.06,
            child: RaisedButton(
              child: Text(
                'Add Photos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              color: Color(0xFF00ad7c),   
              onPressed: () => Navigator.of(context)
                  .pushNamed(AddPhotosForListing.routeName),
            ),
          )
        ],
      ),
    );
  }
}
