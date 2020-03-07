import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_add_photos.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

class AmenitiesScreen extends StatelessWidget {
  static const routeName = '/Amenities';
  @override
  Widget build(BuildContext context) {
    var listingData = Provider.of<ListingProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SizedBox(
        height: height * 0.06,
        child: RaisedButton(
          child: Text('Next'),
          onPressed: () {
            if (listingData.amenities == null ||
                listingData.amenities.length == 0) {
              Fluttertoast.showToast(
                  msg: 'Please Select ameninities your place has');
            } else {
              print(listingData.amenities);
              Navigator.of(context).pushNamed(AddPhotosScreen.routeName);
            }
          },
          color: Color(0xFF00ad7c),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'What amenities will you offer ?',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'You\'ll be able to add more amenities after you publish your listing.',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              child: Wrap(
                children: <Widget>[
                  AmenityBox(
                    listingData: listingData,
                    height: height,
                    width: width,
                    amenityName: 'amenity 1',
                  ),
                  AmenityBox(
                    listingData: listingData,
                    height: height,
                    width: width,
                    amenityName: 'amenity 2',
                  ),
                  AmenityBox(
                    listingData: listingData,
                    height: height,
                    width: width,
                    amenityName: 'amenity 3',
                  ),
                  AmenityBox(
                    listingData: listingData,
                    height: height,
                    width: width,
                    amenityName: 'amenity 4',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmenityBox extends StatelessWidget {
  const AmenityBox({
    Key key,
    @required this.listingData,
    @required this.height,
    @required this.width,
    @required this.amenityName,
  }) : super(key: key);

  final ListingProvider listingData;
  final String amenityName;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if ((listingData.amenities ?? []).contains(amenityName))
          listingData.removeAmenityField(amenityName);
        else
          listingData.addAmenitiesField([amenityName]);
      },
      child: Container(
        child: Text(amenityName),
        margin: EdgeInsets.all(8),
        height: height * 0.2,
        width: width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(
                color: (listingData.amenities ?? []).contains(amenityName)
                    ? Color(0xFF00ad7c)
                    : Colors.grey)),
      ),
    );
  }
}
