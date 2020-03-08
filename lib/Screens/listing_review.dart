import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_amenities.dart';
import 'package:frontend/Screens/listing_location.dart';
import 'package:frontend/Screens/listing_pricing.dart';
import 'package:frontend/Screens/listing_property.dart';
import 'package:frontend/Screens/listing_title.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/Review';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
    Map pricingData = {'minPrice': -1, 'maxPrice': -1, 'basePrice': -1};
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
                'Ok, now lets review your settings',
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
            if (listingData.pricing['minPrice'] > 0 &&
                listingData.pricing['maxPrice'] > 0 &&
                listingData.pricing['basePrice'] > 0) {
              print(listingData.amenities);
              Navigator.of(context).pushNamed(ReviewScreen.routeName);
            } else {
              print(listingData.pricing['minPrice']);
              Fluttertoast.showToast(msg: 'Pricing Details');
            }
          },
          color: Color(0xFF00ad7c),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          (listingData.photos != null)
              ? Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: listingData.photos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                      // color: Color(0xFF00ad7c),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(4),
                        height: height * 0.3,
                        width: width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AssetThumb(
                            asset: listingData.photos[index],
                            width: 300,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          Divider(),
          ListTile(
            title: Text(
              'Property type',
              style: TextStyle(
                // color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              listingData.propertyType,
              style: TextStyle(
                height: 3,
                // color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
            trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(PropertyScreen.routeName),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Location',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Text(
              listingData.location,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
            trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(LocationScreen.routeName),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Amenities',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildAmenityList(listingData),
            ),
            trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(AmenitiesScreen.routeName),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Title',
              style: TextStyle(
                // color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              listingData.title,
              style: TextStyle(
                height: 3,
                // color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(TitleScreen.routeName),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListTile(
              title: Text(
                'Pricing',
                style: TextStyle(
                  // color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: FlatButton(
                child: Text('edit'),
                textColor: Colors.blue,
                onPressed: () =>
                    Navigator.of(context).pushNamed(PricingScreen.routeName),
              ),
              subtitle: Column(
                children: List.generate(
                    3,
                    (index) => Container(
                      margin: EdgeInsets.only(top:8),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${List.from(listingData.pricing.keys)[index].toString()} ',
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '₹ ' +
                                    List.from(listingData.pricing.values)[index]
                                        .toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildAmenityList(ListingProvider data) {
    List<Widget> amenities = [SizedBox()];
    amenities.add(SizedBox(
      height: 15,
    ));
    data.amenities.forEach((e) {
      amenities.add(
        Text(
          e,
          style: TextStyle(
            // color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 18,
            // fontWeight: FontWeight.bold,
          ),
        ),
      );
    });
    return amenities;
  }
}
