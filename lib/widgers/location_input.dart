// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:great_places/utils/location_util.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  var _previewImageUrl = null;

  Future<void> _getCurrentUserLocation() async {

    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(latitude: locData.latitude, longitude: locData.longitude);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? const Text('Local não informado')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Localização atual'),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Selecione no mapa'),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
