import 'dart:async';
import 'dart:developer';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  State<Maps> createState() => MapsState();
}

class MapsState extends State<Maps> {
//Current
  static LocationData? currentLocation;

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
          : GoogleMap(
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
