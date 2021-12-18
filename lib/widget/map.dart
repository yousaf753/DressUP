import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderLocation extends StatefulWidget {
  Position position;

  OrderLocation({Key? key, required this.position}) : super(key: key);

  @override
  _OrderLocationState createState() => _OrderLocationState();
}

class _OrderLocationState extends State<OrderLocation> {
  final Set<Marker> _markers = {};
  final Set<Circle> _circle = {};
  late LatLng latLng;

  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  late Position currentPosition;

  @override
  void initState() {
    locationGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 11.0,
          ),
          markers: _markers,
          circles: _circle,
        ),
      ),
    );
  }

  Future locationGet() async {
    try {
      currentPosition = widget.position;
      setState(() {
        latLng = LatLng(currentPosition.latitude, currentPosition.longitude);
        _markers.add(Marker(
          markerId: MarkerId(latLng.toString()),
          position: latLng,
          infoWindow: const InfoWindow(
            title: 'Really cool place',
            snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
        _circle.add(Circle(
            circleId: CircleId(latLng.toString()),
            center: latLng,
            strokeColor: Colors.black12,
            radius: 50,
            strokeWidth: 2,
            fillColor: Colors.blueGrey));
      });
    } catch (e) {
      print(e);
    }
  }
}
