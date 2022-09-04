import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatePlaces>(context, listen: false).fetchAndSetPlaces(),
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? const Center(child: CircularProgressIndicator(),) : Consumer<GreatePlaces>(
            builder: (context, greatPlaces, ch) => greatPlaces.items.isEmpty ? ch! : ListView.builder(
              itemCount: greatPlaces.items.length,
              itemBuilder: (context, i) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    greatPlaces.items[i].image
                  ),
                ),
                title: Text(greatPlaces.items[i].title),
                onTap: () {
                  //Go to detail page...
                },
              ),
            ),
            child: const Center(child: Text('Got no places yet, start adding some!')),
          ),
        )
      );
  }
}
