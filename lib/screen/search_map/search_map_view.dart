import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;
import 'package:animated_menu/animated_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mp_ui/utils/app_asset.dart';
import 'package:mp_ui/utils/app_textstyle.dart';

class SearchMapLocationScreen extends StatefulWidget {
  const SearchMapLocationScreen({super.key});

  @override
  State<SearchMapLocationScreen> createState() =>
      _SearchMapLocationScreenState();
}

class _SearchMapLocationScreenState extends State<SearchMapLocationScreen> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.2355866, 72.8681931),
    zoom: 11,
  );
  final List<Marker> marker = <Marker>[];
  final List<LatLng> latlng = [
    const LatLng(21.2355866, 72.8681931),
    const LatLng(21.3265317, 72.8448042),
    const LatLng(21.2299576, 72.7913096),
    const LatLng(21.2139835, 72.8436814),
  ];
  var delayMiliseconds = 1500;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  String _mapStyle = "";

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            markers: Set<Marker>.of(marker),
            initialCameraPosition: _kGooglePlex,
            rotateGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
          ),
          Positioned(
              child: SafeArea(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: ZoomIn(
                  delay: Duration(milliseconds: delayMiliseconds),
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: AppStyle.customTextStyle(fontSize: 12.0),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            AssetConstants.icSearch1,
                            width: 10,
                            height: 10,
                          ),
                        ),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Search Location...',
                        contentPadding: const EdgeInsets.all(12.0),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        filled: true,
                      ),
                    ),
                  ),
                )),
                ZoomIn(
                  delay: Duration(milliseconds: delayMiliseconds),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Image.asset(
                      AssetConstants.icSettings,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ))),
          Positioned(
              bottom: 100,
              right: 0,
              left: 0,
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        customPopup(),
                        ZoomIn(
                          delay: Duration(milliseconds: delayMiliseconds),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(217, 115, 115, 115)),
                            child: Image.asset(
                              AssetConstants.icSend,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ZoomIn(
                      delay: Duration(milliseconds: delayMiliseconds),
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(217, 115, 115, 115)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                AssetConstants.icList,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'List of variants',
                              style: AppStyle.customTextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  myPopMenu() {
    PopupMenuButton(
      offset: const Offset(45, 45), // SET THE (X,Y) POSITION
      iconSize: 100,
      icon: const Icon(
        Icons.filter_alt_rounded, // CHOOSE YOUR CUSTOM ICON
        color: Colors.white,
      ),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            enabled: false, // DISABLED THIS ITEM
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // WRITE YOUR CODE HERE
              ],
            ),
          ),
        ];
      },
    );
  }

  PopupMenuItem<String> buildPopItem(String texto, {bool enabled = true}) {
    return PopupMenuItem<String>(
      value: texto,
      enabled: enabled,
      child: Text(texto),
    );
  }

  customPopup() {
    return ZoomIn(
      delay: Duration(milliseconds: delayMiliseconds),
      child: PopupMenuButton(
        color: Color(0xfffbf5eb),

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        offset: const Offset(15, -160),
        popUpAnimationStyle: AnimationStyle(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 800)), // SET THE (X,Y) POSITION
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              enabled: true, // DISABLED THIS ITEM
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        AssetConstants.icPolicy,
                        width: 15,
                        height: 15,
                        color: Color(0xff7c7875),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cosy areas',
                        style: AppStyle.customTextStyle(
                          fontSize: 12.0,
                          color: const Color(0xff7c7875),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            PopupMenuItem(
              enabled: true, // DISABLED THIS ITEM
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        AssetConstants.icWallet,
                        width: 15,
                        height: 15,
                        color: Color(0xff7c7875),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Price',
                        style: AppStyle.customTextStyle(
                          fontSize: 12.0,
                          color: const Color(0xff7c7875),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            PopupMenuItem(
              enabled: true, // DISABLED THIS ITEM
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        AssetConstants.icInfra,
                        width: 15,
                        height: 15,
                        color: Color(0xff7c7875),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Infrastucture',
                        style: AppStyle.customTextStyle(
                          fontSize: 12.0,
                          color: const Color(0xff7c7875),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            PopupMenuItem(
              enabled: true, // DISABLED THIS ITEM
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        AssetConstants.icStack,
                        width: 15,
                        height: 15,
                        color: Color(0xff7c7875),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Without ant layer',
                        style: AppStyle.customTextStyle(
                          fontSize: 12.0,
                          color: const Color(0xff7c7875),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ];
        },
        child: Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(217, 115, 115, 115)),
          child: Image.asset(
            AssetConstants.icStack,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  loadData() async {
    Uint8List? markerImagePlan =
        await getByteFormAssets(AssetConstants.icMarker, 140);
    for (int j = 0; j < latlng.length; j++) {
      log('AJ--> ${j}');

      marker.add(Marker(
          icon: BitmapDescriptor.fromBytes(markerImagePlan!),
          markerId: MarkerId("plain_${j}"),
          position: latlng[j]));
    }
    setState(() {});
  }

  Future<Uint8List?> getByteFormAssets(String path, int widht) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: widht);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }
}