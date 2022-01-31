// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'HikingApi.dart';
import 'HikingPageOnCklick.dart';
import 'HikingData.dart';
import 'Themes.dart';

class HikingDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: theme.last,
          elevation: 0,
          title: Text("Hiking places in Salzburg"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<HikingData>>(
          future: HikingApi.getplaces(),
          builder: (context, snapshot) {
            // ignore: unused_local_variable
            final places = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("Error"));
                } else {
                  return buildPlaces(places);
                }
            }
          },
        ),
      );

  Widget buildPlaces(List<HikingData> places) => Container(
      color: theme.last,
      child: Center(
          child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  HikingPageOnCklick(place: place),
            )),
            leading: Image.network(
              place.imageurl,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text(
              place.tittel,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: theme.first,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
      )));
}
