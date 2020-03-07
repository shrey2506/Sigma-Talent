import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_review.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

class PricingScreen extends StatelessWidget {
  static const routeName = '/Pricing';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
    Map pricingData = {
      'Minumum Price': -1,
      'Maximum Price': -1,
      'Base Price': -1
    };
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
                'Price your space',
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
            if (listingData.pricing['Minimum Price'] > 0 &&
                listingData.pricing['Maximum Price'] > 0 &&
                listingData.pricing['Base Price'] > 0) {
              print(listingData.amenities);
              Navigator.of(context).pushNamed(ReviewScreen.routeName);
            } else {
              print(listingData.pricing['Minimum Price']);
              Fluttertoast.showToast(msg: 'Pricing Details');
            }
          },
          color: Color(0xFF00ad7c),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Text(
              'Set up smart Pricing',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'keep your nightly price competitive as demand in your area changes.',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
              ),
            ),
            GestureDetector(
              child: Text(
                'What is Smart Pricing?',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                  color: Color(0xFF00ad7c),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Minimum price',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'to help you get booked,your price will move close to this when the demand is low'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '₹ ',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      listingData.addPricingField(
                          double.parse(val), 'Minimum Price');
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Text(
                    'Maximun price',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'to help you earn more, your price will move close to this when demand is high.'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '₹ ',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      listingData.addPricingField(
                          double.parse(val), 'Maximum Price');
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Text(
                    'Base price',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      'if you turn off your smart pricing then this will be your default price.'),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '₹ ',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      listingData.addPricingField(
                          double.parse(val), 'Base Price');
                    },
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
