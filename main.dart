import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations App',
      home: LocationServicePage(),
    );
  }
}

class LocationServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giza, Egypt'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          WelcomeMessage(),
          SearchBar(),
          FavoritePlaces(),
          NearestPlaces(),
        ],
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Welcome to Egypt, Hazem!',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search places...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class FavoritePlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Favourite Places',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              PlaceCardWithBackground(
                title: 'Pyramids',
                address: 'Giza Necropolis, Al Haram, Giza Governorate, Egypt',
                distance: '17 km',
                backgroundImage: 'assets/pyramids.jpg',
              ),
              PlaceCardWithBackground(
                title: 'Cairo Tower',
                address: 'Gezira St, Zamalek, Cairo Governorate 11567',
                distance: '10 km',
                backgroundImage: 'assets/tower.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class PlaceCardWithBackground extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String backgroundImage;

  PlaceCardWithBackground({
    required this.title,
    required this.address,
    required this.distance,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Container(
            height: 160.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  color: Colors.black, //
                ),
              ),
              Text(
                address,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                distance,
                style: TextStyle(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: Text('Details'),
              ),
            ],
          ),
        ),
      ],
    )
  );
    
  }
}

class NearestPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nearest Places',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
          PlaceCardWithImage(
            title: 'Temple of Karnak',
            address: 'Karnak, Luxor, Luxor Governorate',
            distance: '702km',
            imagePath: 'assets/temple.jpg',
          ),
          PlaceCardWithImage(
            title: 'Dream Park',
            address: 'El Wahat Road, Entrance 1, Giza Governorate',
            distance: '4km',
            imagePath: 'assets/dream park.jpg',
          ),
        ],
      ),
    );
  }
}

class PlaceCardWithImage extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String imagePath;

  PlaceCardWithImage({
    required this.title,
    required this.address,
    required this.distance,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 48, height: 48),
        title: Text(title),
        subtitle: Text(address),
        trailing: Text(distance),
      ),
    );
  }
}
