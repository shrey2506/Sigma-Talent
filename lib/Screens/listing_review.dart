import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_amenities.dart';
import 'package:frontend/Screens/listing_location.dart';
import 'package:frontend/Screens/listing_pricing.dart';
import 'package:frontend/Screens/listing_property.dart';
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
        children: <Widget>[
          (listingData.photos != null)
              ? AssetThumb(
                  asset: listingData.photos[0],
                  width: 300,
                  height: 200,
                )
              : SizedBox(),
          ListTile(
            title: Text('Property type'),
            subtitle: Text(listingData.propertyType),
            trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(PropertyScreen.routeName),
            ),
          ),
          ListTile(
            title: Text('Location'),
            subtitle: Text(listingData.location),
            trailing: FlatButton(
              child: Text('edit'),
              textColor: Colors.blue,
              onPressed: () =>
                  Navigator.of(context).pushNamed(LocationScreen.routeName),
            ),
          ),
          ListTile(
            title: Text('Amenities'),
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
          ListTile(
            title: Text('Title'),
            subtitle: Text(listingData.title),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListTile(
              title: Text('Pricing'),
              trailing: FlatButton(
                child: Text('edit'),
                textColor: Colors.blue,
                onPressed: () =>
                    Navigator.of(context).pushNamed(PricingScreen.routeName),
              ),
              subtitle: Column(
                children: List.generate(
                    3,
                    (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                '${List.from(listingData.pricing.keys)[index].toString()} '),
                            Text(List.from(listingData.pricing.values)[index]
                                .toString()),
                          ],
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
    data.amenities.forEach((e) {
      amenities.add(Text(e));
    });
    return amenities;
  }
}
