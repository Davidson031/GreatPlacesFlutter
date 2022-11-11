import 'package:flutter/material.dart';
import 'package:great_places/pages/place_form_screen.dart';
import 'package:great_places/pages/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'providers/great_places.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigo,
            secondary: Colors.amber,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
        },
      ),
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (ctx) => GreatPlaces(),
//       child: MaterialApp(
//         title: 'Great Places',
//         theme: ThemeData(
//           primarySwatch: Colors.indigo,
//         ),
//         home: PlacesListScreen(),
//         routes: {
//           AppRoutes.PLACE_FORM : (ctx) => PlaceFormScreen(),
//         },
//       ),
//     );
//   }
// }
