import 'dart:async';
import 'dart:developer';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDelivery extends StatefulWidget {
  double lat;
  double long;
  MapsDelivery({super.key, required this.lat, required this.long});

  @override
  State<MapsDelivery> createState() => MapsDeliveryState();
}

class MapsDeliveryState extends State<MapsDelivery> {
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

  static late Marker _kGooglePlexMarker1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    _kGooglePlexMarker1 = Marker(
        markerId: MarkerId('_kGooglePlex'),
        infoWindow: InfoWindow(title: 'Organisation 1'),
        icon: BitmapDescriptor.defaultMarker,
        // position: LatLng(8.55012961315801, 76.94184412180768));
        position: LatLng(widget.lat, widget.long));
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
