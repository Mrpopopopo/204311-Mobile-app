import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(
          150,
          (i) =>
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<String> items;
  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return FavoriteWidgetSetsateState(items: items);
  }
}

class FavoriteWidgetSetsateState extends StatefulWidget {
  final List<String> items;
  const FavoriteWidgetSetsateState({super.key, required this.items});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidgetSetsateState(items: items);
  }
}

class _FavoriteWidgetSetsateState extends State<FavoriteWidgetSetsateState> {
  final List<String> items;
  int count = 0;
  _FavoriteWidgetSetsateState({required this.items});
  List<bool> _items = List<bool>.generate(150, (index) => false);

  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';
    void _toddgelFavorite(int index) {
      setState(() {
        if (_items[index]) {
          _items[index] = false;
          count -= 1;
        } else {
          _items[index] = true;
          count += 1;
        }
      });
    }

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: count == 0 ? Text(title) : Text(title + '($count)'),
        ),
        body: ListView.builder(
          itemCount: items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: Stack(
                  // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(items[index * 3]),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _toddgelFavorite(index * 3);
                        });
                      },
                      icon: (_items[index * 3]
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                            )),
                      iconSize: 50,
                    )
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(items[index * 3 + 1]),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _toddgelFavorite(index * 3 + 1);
                        });
                      },
                      icon: (_items[index * 3 + 1]
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                            )),
                      iconSize: 50,
                    ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(items[index * 3 + 2]),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _toddgelFavorite(index * 3 + 2);
                        });
                      },
                      icon: (_items[index * 3 + 2]
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border,
                            )),
                      iconSize: 50,
                    )
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
