import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HansikImagePage extends StatefulWidget {
  @override
  _ChickenImagePageState createState() => _ChickenImagePageState();
}

class _ChickenImagePageState extends State<HansikImagePage> {
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
        title: Text('한식'),
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
                myLocationEnabled: true, // 사용자의 위치 표시
                onMapCreated: (controller) {
                  _onMapCreated(controller);
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

    // 위치 가져오기
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: HansikImagePage(),
  ));
}