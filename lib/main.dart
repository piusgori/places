import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/screens/add_place_screen.dart';
import 'package:places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatePlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber
        ),
        home: const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => const AddPlaceScreen()
        },
      ),
    );
  }
}


