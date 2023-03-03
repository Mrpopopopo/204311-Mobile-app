import 'package:flutter/material.dart';
import 'video_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "HW09",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ListViewBuilder());
  }
}

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({Key? key}) : super(key: key);
  final List<String> VideoName = [
    'baby shark',
    'VDoge Store Clerk (Shiba)--Shiba Inu In Tokyo',
    'Cat Takes Down Other Cat',
    'CS:GO, but weapons from your childhood:',
    'Top 5 Capybara',
  ];
  final List<String> image = [
    'assests/image/image1.png',
    'assests/image/image2.png',
    'assests/image/image3.png',
    'assests/image/image4.png',
    'assests/image/image5.png'
  ];
  final List<String> UploadTime = [
    '6 hours',
    '6 hours',
    '6 hours',
    '6 hours',
    '6 hours'
  ];
  final List<String> video = [
    'assests/video/v1.mp4',
    'assests/video/v2.mp4',
    'assests/video/v3.mp4',
    'assests/video/v4.mp4',
    'assests/video/v5.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Youtube Video Demo")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Column(
                children: [
                  Image.asset(image[index]),
                  Row(
                    children: [
                      const Icon(Icons.account_circle),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(VideoName[index]),
                            Text('Entry ${UploadTime[index]}')
                          ])
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VideoPLayerScreenState(
                              videoName: VideoName[index],
                              video: video[index],
                            )));
              },
            );
          }),
    );
  }
}
