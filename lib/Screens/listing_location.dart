import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Screens/listing_amenities.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
// import 'package:google_map_location_picker_example/keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'generated/i18n.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/Location';
  @override
  Widget build(BuildContext context) {
    return MapInterface();
  }
}

class MapInterface extends StatefulWidget {
  @override
  _MapInterfaceState createState() => _MapInterfaceState();
}

class _MapInterfaceState extends State<MapInterface> {
  LocationResult _pickedLocation;

  @override
  Widget build(BuildContext context) {
    var listingData = Provider.of<ListingProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var addressController = TextEditingController();
    addressController.text =
        (_pickedLocation != null) ? _pickedLocation.address.toString() : '';
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
                'Pick Your Location',
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
    return MaterialApp(
//      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: SizedBox(
          height: height * 0.06,
          child: RaisedButton(
            child: Text('Next'),
            onPressed: () {
              if (listingData.location != '') {
                Navigator.of(context).pushNamed(AmenitiesScreen.routeName);
              } else {
                Fluttertoast.showToast(
                    msg: 'Please Select where your property is located');
              }
            },
            color: Color(0xFF00ad7c),
          ),
        ),
        appBar: appBar,
        body: Builder(builder: (context) {
          var listingData = Provider.of<ListingProvider>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.8,
                  child: TextFormField(
                    controller: addressController,
                    maxLines: 5,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (val) {
                      listingData.addLocationField(addressController.text);
                    },
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  height: height * 0.06,
                  child: RaisedButton(
                    color: Color(0xFF00ad7c),
                    // textColor: Colors.white,
                    onPressed: () async {
                      LocationResult result = await showLocationPicker(
                        context,
                        'AIzaSyBvkJTyAewJhP7hHpC7hwWB_fjaoPZmDUM',
                        initialCenter: LatLng(0.00, 0.00),
                        //  automaticallyAnimateToCurrentLocation: true,
                        //  mapStylePath: 'assets/mapStyle.json',
                        myLocationButtonEnabled: true,
                        layersButtonEnabled: true,
                        //  resultCardAlignment: Alignment.bottomCenter,
                      );
                      print("result = $result");
                      setState(() {
                        _pickedLocation = result;
                        listingData.addLocationField(result.address);
                      });
                    },
                    child: Text(
                      'Pick location',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
