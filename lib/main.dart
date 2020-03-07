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
        child: FlatButton(
          child: Text('Start Listing'),
          onPressed: () =>
              Navigator.of(context).pushNamed(ListingHomeScreen.routeName),
        ),
      ),
    );
  }
}
