import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: ((context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: ((context, places, child) {
                      if (places.itemsCount == 0) {
                        return child!;
                      } else {
                        return ListView.builder(
                          itemCount: places.itemsCount,
                          itemBuilder: (ctx, i) {
                            return ListTile(
                              onTap: () {},
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  places.itemByIndex(i).image,
                                ),
                              ),
                              title: Text(places.itemByIndex(i).title),
                            );
                          },
                        );
                      }
                    }),
                    child: const Center(child: Text('Nenhum local encontrado')),
                  )),
      ),
    );
  }
}
