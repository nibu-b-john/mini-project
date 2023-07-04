import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  String waste_type;
  String recyclable_type;
  String email;
  Maps(
      {super.key,
      required this.waste_type,
      required this.email,
      required this.recyclable_type});

  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
//Current
  static LocationData? currentLocation;
  late double? latitude;
  late double? longitude;
  Future<void> getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) => {
          setState(() {
            currentLocation = location;
          })
        });

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
    });
    latitude = currentLocation!.latitude;
    latitude = currentLocation!.longitude;
    log(currentLocation.toString());
  }

  //Maps
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    // target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const Marker _kGooglePlexMarker1 = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Organisation 1'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(8.55012961315801, 76.94184412180768));
  static const Marker _kGooglePlexMarker2 = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Organisation 2'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(8.549222491487468, 76.94259245811591));
  static const Marker _kGooglePlexMarker3 = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Organisation 3'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(8.551259550440298, 76.94229191480419));
  static const Marker _kGooglePlexMarker4 = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Organisation 4'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(8.552004885955784, 76.94208578657859));
  static const Marker _kGooglePlexMarker5 = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(title: 'Organisation 5'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(8.553682414075555, 76.93402379540439));
  static final Marker _mbc = Marker(
      markerId: const MarkerId('_kGooglePlex'),
      infoWindow: const InfoWindow(title: 'Your Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position:
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!));

  // static final CameraPosition _kLake = const CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  // static final Marker _kLakeMarker = Marker(
  //     markerId: MarkerId('_kGooglePlex'),
  //     infoWindow: InfoWindow(title: 'Google plex'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: LatLng(37.43296265331129, -122.08832357078792));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    log('inside');
    getCurrentLocation();
    return Scaffold(
      body: currentLocation == null
          ? Text('Loading')
          : Stack(
              children: [
                GoogleMap(
                  markers: {
                    _kGooglePlexMarker1,
                    _kGooglePlexMarker2,
                    _kGooglePlexMarker3,
                    _kGooglePlexMarker4,
                    _kGooglePlexMarker5,
                    _mbc
                  },
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        final _db = FirebaseFirestore.instance;
                        _db
                            .collection('User')
                            .where('email', isEqualTo: widget.email)
                            .get()
                            .then(((value) => value.docs.forEach((element) {
                                  List<Map<String, dynamic>> listoforders =
                                      element['list'];

                                  listoforders.add({
                                    'wasteType': widget.waste_type,
                                    'recyclableType': widget.recyclable_type,
                                    "lat": latitude,
                                    "long": longitude
                                  });

                                  _db
                                      .collection('Users')
                                      .doc(element.id)
                                      .update({'email': 'ehy'})
                                      .then((value) => log("User Updated"))
                                      .catchError((error) =>
                                          log("Failed to update user: $error"));
                                  ;
                                })));
                        log("Successfully added    0");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add to bin',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.handyman,
                            color: Colors.black,
                          )
                        ],
                      )),
                ),
              ],
            ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
