import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(MaterialApp(
    title: "My app",
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.pink,
          ),
        ),
        title: Center(child: Text('Chiangmai')),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.ios_share_rounded,
                  color: Colors.pink),
          ),

          IconButton(
              onPressed: null, icon: Icon(Icons.favorite,color: Colors.pink)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                children: [
                  Image.asset(
                    'asset/pic1.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/pic2.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/pic3.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/pic4.jpeg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/pic5.jpeg',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  print('Page changed: $value');
                },
                autoPlayInterval: 3000,
                isLoop: true,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'UNESCO Sustainable Travel Pledge',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Shangri-La Chiangmai',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '★★★★★',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Luxury hotel with free water park, near',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Chiang Mai Night Bazaar',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '9.0/10 Superb',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '1,000 verified Hotels.com guest reviews',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'See all 1,000 reviews >',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                    ]),
              ),
              Container(
                child: Text(
                  'Popular amenities',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Colors.white,
                          ),
                          Text(
                            'Free wifi',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 99,
                          ),
                          Icon(
                            Icons.pool,
                            color: Colors.white,
                          ),
                          Text(
                            'Pool',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            color: Colors.white,
                          ),
                          Text(
                            'Air conditioning',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Icon(
                            Icons.directions_car,
                            color: Colors.white,
                          ),
                          Text(
                            'Free parking',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          Text(
                            'Gym',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 122,
                          ),
                          Icon(
                            Icons.thermostat,
                            color: Colors.white,
                          ),
                          Text(
                            'Refrigerator',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                height:10 ,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("asset/pic.jpeg"),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * 0.92,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
              child: Text(
            'Select a room',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
              color: Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
