import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final Function onLatChange;
  const MapWidget({Key? key, required this.onLatChange}) : super(key: key);
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController darkMapController;
  late GoogleMapController lightMapController;
  LatLng? latlng;
  late BitmapDescriptor pinLocationIcon;
  bool isLoaded = false;

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  Future setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(48, 48),
        ),
        'Assets/icons/location-marker.png');
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // await setCustomMapPin();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location Service are disabled',
          snackPosition: SnackPosition.TOP);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    latlng = LatLng(position.latitude, position.longitude);

    setState(() {
      isLoaded = true;
    });
  }

  setLocation(LatLng onLangChange) {
    setState(() {
      latlng = onLangChange;
      widget.onLatChange(latlng);
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 200,
              child: GoogleMap(
                onMapCreated: (controller) => {
                  darkMapController = controller,
                  lightMapController = controller,
                  setLocation(LatLng(latlng!.latitude, latlng!.longitude)),
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onTap: (LatLng ontapLatLng) {
                  setLocation(ontapLatLng);
                },
                markers: {
                  Marker(
                      draggable: true,
                      onDragEnd: (LatLng onDragLatLng) => {
                            setLocation(onDragLatLng),
                          },
                      position: LatLng(latlng!.latitude, latlng!.longitude),
                      //add cutom marker  icon here

                      markerId: const MarkerId("1"))
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(latlng!.latitude, latlng!.longitude),
                  zoom: 15,
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
