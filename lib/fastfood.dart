import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class FastfoodImagePage extends StatefulWidget {
  @override
  _ChickenImagePageState createState() => _ChickenImagePageState();
}

class _ChickenImagePageState extends State<FastfoodImagePage> {
  late GoogleMapController _mapController;
  LatLng? _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('패스트푸드'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Container(
              width: 348,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
              ),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition ?? LatLng(37.421998, 127.088),
                  zoom: 15,
                ),
                mapType: MapType.normal,
                myLocationEnabled: true,
                onMapCreated: (controller) {
                  _onMapCreated(controller);
                },
                onTap: (LatLng position) {
                  _launchGoogleMaps(position.latitude, position.longitude);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스 활성화 여부 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화된 경우 처리
      return;
    }

    // 위치 권한 확인 및 요청
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // 위치 권한이 거부된 경우 처리
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });

    if (_mapController != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _initialPosition!,
            zoom: 15,
          ),
        ),
      );
    }
  }
  void _launchGoogleMaps(double latitude, double longitude) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}



void main() {
  runApp(MaterialApp(
    home: FastfoodImagePage(),
  ));
}