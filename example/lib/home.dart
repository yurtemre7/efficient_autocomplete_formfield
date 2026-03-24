import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final abc = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  final persons = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
    'Charlie Black',
    'Daisy White',
    'Eve Green',
    'Frank Blue',
    'Grace Yellow',
    'Hannah Purple',
  ];

  String? currentAbc;
  String? currentPerson;

  TextEditingController abcController = TextEditingController();
  TextEditingController personController = TextEditingController();

  FocusNode abcFocusNode = FocusNode();
  FocusNode personFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    abcController.dispose();
    personController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EAF Example')),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Autocomplete<String>(
                    textEditingController: abcController,
                    focusNode: abcFocusNode,
                    optionsBuilder: (search) {
                      var result = abc
                          .where((element) => element.contains(search.text))
                          .toList();
                      return Future.value(result);
                    },
                  ),
                  const SizedBox(height: 20),
                  Text('Current Value: ${currentAbc ?? 'None'}'),
                  const SizedBox(height: 20),
                  Autocomplete<String>(
                    textEditingController: personController,
                    focusNode: personFocusNode,
                    optionsBuilder: (search) {
                      var result = persons
                          .where((element) => element.contains(search.text))
                          .toList();
                      return Future.value(result);
                    },
                    onSelected: (option) {
                      setState(() {
                        currentPerson = option;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text('Current Value: ${currentPerson ?? 'None'}'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
