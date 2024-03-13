import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GeoLocationExample extends StatefulWidget {
  const GeoLocationExample({super.key});

  @override
  State<GeoLocationExample> createState() => _GeoLocationExampleState();
}

class _GeoLocationExampleState extends State<GeoLocationExample> {
  String locationMessage = 'Current Location:';
  String latitude = '';
  String longitude = '';

  void _liveLocaiton() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((event) {
      latitude = event.latitude.toString();
      longitude = event.longitude.toString();

      setState(() {
        locationMessage = 'Location: $latitude, $longitude';
      });
    });
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _openMap(String latitude, String longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    Uri googleUri = Uri.parse(googleUrl);

    await canLaunchUrl(googleUri) ? await launchUrl(googleUri) : throw 'Could not open $googleUrl.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeoLocationExample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _getCurrentLocation().then((value) => {
                    latitude = value.latitude.toString(),
                    longitude = value.longitude.toString(),
                    setState(() {
                      locationMessage = 'Location: $latitude, $longitude';
                    }),
                    _liveLocaiton(),
                  }),
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
