import 'package:flutter/material.dart';
import 'package:frontend/Screens/add_photos_for_listing.dart';
import 'package:frontend/Screens/listing_add_photos.dart';
import 'package:frontend/Screens/listing_amenities.dart';
import 'package:frontend/Screens/listing_home_screen.dart';
import 'package:frontend/Screens/listing_location.dart';
import 'package:frontend/Screens/listing_pricing.dart';
import 'package:frontend/Screens/listing_property.dart';
import 'package:frontend/Screens/listing_review.dart';
import 'package:frontend/Screens/listing_title.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListingProvider()),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(),
          theme: ThemeData(
              textTheme: TextTheme(
                  body2: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.black,
              )),
              // primaryColor: Colors.white,
              // accentColor: Colors.black,
              appBarTheme: AppBarTheme(color: Colors.white)),
          routes: {
            ListingHomeScreen.routeName: (context) => ListingHomeScreen(),
            PropertyScreen.routeName: (context) => PropertyScreen(),
            LocationScreen.routeName: (context) => LocationScreen(),
            AmenitiesScreen.routeName: (context) => AmenitiesScreen(),
            AddPhotosScreen.routeName: (context) => AddPhotosScreen(),
            TitleScreen.routeName: (context) => TitleScreen(),
            PricingScreen.routeName: (context) => PricingScreen(),
            ReviewScreen.routeName: (context) => ReviewScreen(),
            AddPhotosForListing.routeName: (context) => AddPhotosForListing(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StartListing(),
      ),
    );
  }
}

class StartListing extends StatelessWidget {
  const StartListing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView(
          children: <Widget>[
            Card(
                child: Container(
              height: height * 0.1,
              width: width * 0.85,
              child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ListingHomeScreen.routeName);
                  },
                  leading: Icon(
                    Icons.add,
                    color: Color(0xFF00ad7c),
                    size: 35,
                  ),
                  title: Text(
                    'Start New',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
              child: Text(
                'Existing Listings',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              elevation: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: height * 0.18,
                    width: width * 0.45,
                    child: Image.network(
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/brewster-mcleod-architects-1486154143.jpg?crop=1.00xw:1.00xh;0,0&resize=480:*',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: height * 0.18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Millfield Lodge',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.45,
                          child: Text(
                            'Daniela Sosa Casilla de Correo 432 Correo',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Max Price - ₹ 15000',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Min Price - ₹ 11000',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Base Price - ₹ 13000 ',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              elevation: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: height * 0.18,
                    width: width * 0.45,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/proxy/FWRb4rVaeboBQv2l-4z33y1QFW1cpRCeStEzA5bzM2SaelfF2UtVjXvp-BVQVIogcMp-P1hvs9qK236ShePR3VD2B6YTcysjIIe38HstKYTKZcwpHNMOe22w4SmMoWNRVFSL6j61',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: height * 0.18,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            'Meadow View',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.45,
                          child: Text(
                            '374 William S Canning Blvd, Fall River MA 2721',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Max Price - ₹ 15000',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Min Price - ₹ 11000',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Base Price - ₹ 13000 ',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
