import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Adress Form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Adress Form'),
          ),
          body: MyCustomForm(),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _key = GlobalKey<FormState>();
  final EmailController = TextEditingController();
  final ZipCodeController = TextEditingController();

  Map<String, List<String>> city = {};

  String district = "";

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/tambon_chiangmai.csv");
    List<List<dynamic>> _listData =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      for (var i = 1; i < _listData.length; i++) {
        if (city[_listData[i][1]] == null) {
          city[_listData[i][1]] = [_listData[i][0]];
        } else {
          city[_listData[i][1]]?.add(_listData[i][0]);
        }
      }
      // for (var i = 1; i < _listData.length; i++) {
      //   print(city[_listData[i][1]]);
      // }
      print(city);
      ;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Email Address"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              } else if (!EmailValidator.validate(value)) {
                return "Invliad Email Format";
              }
              return null;
            },
            controller: EmailController,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Enter Zip Code"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Zip Code";
              } else if (value.length != 5) {
                return "Invliad Zip Code Format";
              }
            },
            controller: ZipCodeController,
          ),
          Row(
            children: [
              Text(
                "Provice:Chiang Mai",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "District",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                return city.keys.where((String fruit) {
                  return fruit
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selection) {
              district = selection;
            },
          ),
          Row(
            children: [
              Text(
                "Tambon",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == "") {
                return const Iterable<String>.empty();
              } else {
                List<String> Tb = city[district]!;
                return Tb.where((String fruit) {
                  return fruit
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              }
            },
            onSelected: (String selection) {
              district = selection;
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Processing Data")));
                }
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
