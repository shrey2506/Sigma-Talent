import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ListingProvider with ChangeNotifier {
  String propertyType;
  String location = '';
  List amenities;
  List<Asset> photos = [];
  String title = '';
  Map pricing = {'Minimum Price': -1, 'Maximum Price': -1, 'Base Price': -1};

  void addPropertyField(String data) {
    this.propertyType = data;
    notifyListeners();
  }

  void addLocationField(String data) {
    this.location = data;
    notifyListeners();
  }

  void addAmenitiesField(List data) {
    List totalAmenities = amenities ?? [];
    data.forEach((amenity) {
      totalAmenities.add(amenity);
    });
    this.amenities = totalAmenities;
    notifyListeners();
  }

  void removeAmenityField(String data) {
    amenities.remove(data);
    notifyListeners();
  }

  void addPhotosField(List data) {
    this.photos = data;
    notifyListeners();
  }

  void addPricingField(double data, String priceType) {
    this.pricing[priceType] = data;
    notifyListeners();
  }

  void addTitleField(String data) {
    this.title = data;
    notifyListeners();
  }
}