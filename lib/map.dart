import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 12.0,
  );
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currentLocation = await location.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });
  }

  Future<void> _onMapTap(LatLng latLng) async {
    if (_currentLocation != null) {
      final apiKey = 'AIzaSyCdSsJlKMXXP-fcdAtCaKZDHgLvlFMYag4'; // Google Places API 키 입력
      final radius = 500;
      final url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latLng.latitude},${latLng.longitude}&radius=$radius&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      if (data['status'] == 'OK' && data['results'] != null && data['results'].isNotEmpty) {
        final placeId = data['results'][0]['place_id'];
        final detailsUrl = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

        final detailsResponse = await http.get(Uri.parse(detailsUrl));
        final detailsData = json.decode(detailsResponse.body);

        if (detailsData['status'] == 'OK' && detailsData['result'] != null) {
          final placeDetails = detailsData['result'];

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(placeDetails['name'] ?? ''),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도'),
      ),
      body: _currentLocation != null
          ? GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            _currentLocation!.latitude!,
            _currentLocation!.longitude!,
          ),
          zoom: 15.0,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: _onMapTap,
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
