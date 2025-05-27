import 'dart:developer';

import 'package:efficient_autocomplete_formfield/efficient_autocomplete_formfield.dart';
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
                  EfficientAutocompleteFormField<String>(
                    controller: abcController,
                    decoration: InputDecoration(labelText: 'Select an alphabet character'),
                    suggestionsBuilder: (context, items) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: items,
                        ),
                      );
                    },
                    itemBuilder: (context, item) {
                      if (item == null) {
                        return const SizedBox();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(item),
                      );
                    },
                    onSearch: (search) {
                      var result = abc.where((element) => element.contains(search)).toList();
                      return Future.value(result);
                    },
                    onChanged: (value) {
                      setState(() {
                        currentAbc = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please type something';
                      }
                      if (!abc.contains(value)) {
                        return 'Invalid alphabet character';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  const SizedBox(height: 20),
                  Text('Current Value: ${currentAbc ?? 'None'}'),
                  const SizedBox(height: 20),
                  EfficientAutocompleteFormField<String>(
                    controller: personController,
                    decoration: InputDecoration(labelText: 'Select a person'),
                    suggestionsBuilder: (context, items) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: items,
                        ),
                      );
                    },
                    itemBuilder: (context, item) {
                      if (item == null) {
                        return const SizedBox();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text(item),
                      );
                    },
                    onSearch: (search) {
                      var result = persons.where((element) => element.contains(search)).toList();
                      return Future.value(result);
                    },
                    onChanged: (value) {
                      setState(() {
                        currentPerson = value;
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
