import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/Screens/listing_title.dart';
import 'package:frontend/utils/listing_provider.dart';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

void main() => runApp(new AddPhotosForListing());

class AddPhotosForListing extends StatefulWidget {
  static const routeName = '/add_photos_for_listing';
  @override
  _AddPhotosForListingState createState() => new _AddPhotosForListingState();
}

class _AddPhotosForListingState extends State<AddPhotosForListing> {
  // List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView(ListingProvider listingData) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate((listingData.photos ?? []).length, (index) {
        Asset asset = listingData.photos[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets(ListingProvider listingData) async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 20,
        enableCamera: true,
        selectedAssets: listingData.photos,
        // cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          statusBarColor: "#00ad7c",
          actionBarColor: "#00ad7c",
          actionBarTitle: "Select your Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#00ad7c",
        ),
      );
      print(listingData.photos);
    } on Exception catch (e) {
      error = e.toString();
      log(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      listingData.photos = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var listingData = Provider.of<ListingProvider>(context);
    // images = listingData.photos;
    return new MaterialApp(
      home: new Scaffold(
        floatingActionButton: SizedBox(
          height: height * 0.06,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Next'),
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
        appBar: AppBar(
          backgroundColor: Color(0xFF00ad7c),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: <Widget>[
            Divider(),
            SizedBox(
              width: width,
              height: height * 0.06,
              child: FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add Images'),
                onPressed: () => loadAssets(listingData),
              ),
            ),
            Divider(),
            // Center(child: Text('Error: $_error')),
            // RaisedButton(
            //   child: Text("Pick images"),
            //   onPressed: loadAssets,
            // ),
            Expanded(
              child: buildGridView(listingData),
            )
          ],
        ),
      ),
    );
  }
}
