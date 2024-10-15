import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project/base/Remote/api_config.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AddressProvider with ChangeNotifier {
  bool isLoadings = true;
  var categoriesId;

  LatLng lastMapPosition = const LatLng(0.0, 0.0);

  //LatLng get lastMapPosition => center;
  var loadedLocation = false;

  init() {
    isLoadings = true;
  }

  // setDefaultAddress(defaultAddress){
  //   this.defaultAddress = defaultAddress;
  // }

  setCenter(value) {
    lastMapPosition = value;
    notifyListeners();
  }

  //AddressModal? data;

  double? latitude;
  double? longitude;
  String? address;
  String? pinCode;
  String? state;
  String? Locality;
  String? Country;

  String? houseNumber;
  String? locationId;
  String? appartmentOffice;
  String? landmark;
  String? tag;
  String? otherTag;
  String? isDefault;

  // setTagData(DataModal value){
  //   houseNumber = value.houseNumber;
  //   appartmentOffice = value.appartmentOffice;
  //   landmark = value.landmark;
  //   tag = value.tag;
  //   otherTag = value.otherTag;
  //   isDefault = value.isDefault;
  //   address = value.address;
  //   latitude = double.parse(value.latitude!);
  //   longitude = double.parse(value.longitude!);
  //   lastMapPosition = LatLng(latitude!, longitude!);
  // }

  clearTag() {
    houseNumber = "";
    appartmentOffice = "";
    landmark = "";
    tag = "";
    otherTag = "";
    address = "";
    pinCode = "";
    isDefault = "";
    latitude = 0.0;
    longitude = 0.0;
    lastMapPosition = const LatLng(0.0, 0.0);
  }

  setData(
    LatLng center,
    address, {
    state,
    city,
    pincode,
  }) {
    latitude = center.latitude;
    longitude = center.longitude;
    this.Locality = city;
    this.Country = state;
    this.pinCode = pinCode;

    this.address = address;
    loadedLocation = true;
    setCenter(center);
  }

  TextEditingController controller = TextEditingController();
  String _currentAddress = "";
  final Completer<GoogleMapController> _controller = Completer();
  LatLng current = const LatLng(0.0, 0.0);
  CameraPosition? _cameraPosition;
  appDialog(BuildContext context, String message, type) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          title: const Text("",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600)),
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    // primary: blackColor, // background
                    // onPrimary: whiteColor, // foreground
                    ),
                onPressed: () {
                  if (type == "back") {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                  }

                  // getAddressApi("back");
                },
                child: const Text('OK')),
          ],
        ),
      ),
    );
  }

  gpsButton() {
    return InkWell(
      onTap: () async {
        Position position = await getGeoLocationPosition();
        moveCamera(LatLng(position.latitude, position.longitude), "");
        // getAddressFromLatLong(position);
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: const Icon(
          Icons.gps_fixed,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  doneButton() {
    return InkWell(
      onTap: () async {
        if (_currentAddress == "") {
          String? address =
              await getAddress(_cameraPosition?.target ?? current);
          pinCode = await getPostalCode(_cameraPosition?.target ?? current);
          setData(_cameraPosition?.target ?? current, address);
        } else {
          setData(_cameraPosition?.target ?? current, _currentAddress);
        }
        // Navigator.pop(context, [controller.text, pinCode]);
        // /
        // getLocation();
      },
      child: Container(
        height: 44,
        width: MediaQuery.of(Routes.navigatorKey.currentContext!).size.width,
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: const Center(
            child: Text(
          "Confirm Address",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }

  bool _isMapCreated = false;
  buildGoogleMap() {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          GoogleMap(
            compassEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (controller) async {
              if (!_isMapCreated) {
                // Check if the map is already created
                _controller.complete(controller);
                _isMapCreated = true; // Set the flag to true
                try {
                  Position position = await getGeoLocationPosition();
                  if (position.latitude != 0.0 && position.longitude != 0.0) {
                    await moveCamera(
                        LatLng(position.latitude, position.longitude), "");
                    await getAddressFromLatLong(
                        LatLng(position.latitude, position.longitude));
                  }
                } catch (e) {
                  log("Error during map creation: $e");
                }
              }
            },
            initialCameraPosition: CameraPosition(
              target: current,
              zoom: 15,
            ),
            onCameraMove: (CameraPosition position) {
              _cameraPosition = position;
            },
            onCameraIdle: () async {
              if (_cameraPosition != null) {
                await getAddressFromLatLong(_cameraPosition?.target ?? current);
              }
            },
          ),
          const Center(
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  placesAutoCompleteTextField() {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GooglePlaceAutoCompleteTextField(
        boxDecoration: const BoxDecoration(color: Colors.transparent),
        textEditingController: controller,
        googleAPIKey: kGoogleApiKey,
        inputDecoration: const InputDecoration(
          isDense: true,
          hintText: "Search your location",
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
        debounceTime: 600,
        countries: const ["in", "fr"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) async {
          if (prediction.lat != null && prediction.lng != null) {
            LatLng center = LatLng(
                double.parse(prediction.lat!), double.parse(prediction.lng!));
            await moveCamera(center, prediction.description);
          } else {
            log("Prediction latitude or longitude is null.");
          }
        },
        itemClick: (Prediction prediction) async {
          controller.text = prediction.description!;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description!.length),
          );

          // After item selection, move the camera
          if (prediction.lat != null && prediction.lng != null) {
            LatLng center = LatLng(
                double.parse(prediction.lat!), double.parse(prediction.lng!));
            await moveCamera(center, prediction.description);
          } else {
            log("Selected prediction latitude or longitude is null.");
          }
        },
      ),
    );
  }

  Future<String?> getAddress(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String fullAddress =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      log("Full Address: $fullAddress"); // Log the full address
      log("Latitude: ${position.latitude}, Longitude: ${position.longitude}"); // Log the lat long
      return fullAddress;
    }
    return null;
  }

  Future<String?> getPostalCode(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      return '${place.postalCode}';
    }
    return null;
  }

  Future<void> moveCamera(LatLng latLng, String? address) async {
    _currentAddress = address ?? "";
    current = latLng;

    try {
      final GoogleMapController controller = await _controller.future;

      await controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 15)));
    } catch (e) {
      log("Error moving camera: $e");
    }
  }

  String fullAddress = '';
  double? lat;
  double? long;

  Future<void> getAddressFromLatLong(LatLng position) async {
    // Check if the coordinates are valid
    if (position.latitude == 0.0 && position.longitude == 0.0) {
      log("Invalid coordinates: (${position.latitude}, ${position.longitude})");
      return; // Don't proceed with geocoding
    }

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        fullAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        controller.text = fullAddress;
        latitude = position.latitude ?? 0.0;
        longitude = position.longitude ?? 0.0;

        log("Full Address from LatLng: $fullAddress");
        log("Latitude: $latitude, Longitude: $longitude");

        notifyListeners();
      } else {
        log("No placemarks found for the coordinates.");
      }
    } catch (e) {
      log("Error retrieving address: $e");
    }
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Validate position
    if (position.latitude == 0.0 && position.longitude == 0.0) {
      return Future.error('Invalid location obtained.');
    }

    return position;
  }

  void setAddressDetails(String? addr, double? lat, double? long) {
    address = addr;
    latitude = lat;
    longitude = long;
    notifyListeners();
  }
}
