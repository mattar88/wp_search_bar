import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wp_search_bar/wp_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> data = [
    {'name': "Mohammad", 'message': "message from mhammad"},
    {'name': "Kamel", 'message': "message from kamel"},
    {'name': "Nadine", 'message': "how are you ?"},
    {'name': "Joseph", 'message': "hello...!"},
    {'name': "71966691", 'message': "Hi"},
    {'name': "03405609", 'message': "hiiii...."},
    {'name': "Mohammad", 'message': "message from mhammad"},
    {'name': "Kamel", 'message': "message from kamel"},
    {'name': "Nadine", 'message': "how are you ?"},
    {'name': "Joseph", 'message': "hello...!"},
    {'name': "71966691", 'message': "Hi"},
    {'name': "03405609", 'message': "hiiii...."},
  ];
  List<Map<String, String>> filteredData = [];
  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WPSearchBar(
        listOfFilters: const {
          'name': {
            'name': 'name',
            'selected': false,
            'title': 'Name',
            'operation': 'CONTAINS',
            'icon': Icons.supervised_user_circle_rounded,
          },
          'message': {
            'name': 'message',
            'selected': false,
            'title': 'Message',
            'operation': 'CONTAINS',
            'icon': Icons.message,
          },
          'date': {
            'name': 'Date',
            'selected': false,
            'title': 'Date',
            'operation': 'CONTAINS',
            'icon': Icons.date_range,
          },
          'other': {
            'name': 'other',
            'selected': false,
            'title': 'Other',
            'operation': 'CONTAINS',
            'icon': Icons.more,
          },
        },
        materialDesign: const {
          'title': {'text': 'WhatsApp'},
        },
        onSearch: (filter, value, operation) {
          // log('${this.data}');
          filteredData = data.where((Map<String, String> element) {
            // log('Element----');
            log('Element  ${element[filter]}, filter: ${filter}, value: ${value}');
            if (filter != null &&
                element[filter] != null &&
                element[filter]!.toLowerCase().contains(value.toLowerCase())) {
              return true;
            } else {
              if (element['message']!
                  .toLowerCase()
                  .contains(value.toLowerCase())) {
                return true;
              }
            }
            return false;
          }).toList();
          // log('OnSearch output---${filter}, ${operation}, ${value}}');
          setState(() {
            filteredData;
          });
        },
        body: Container(
          decoration: const BoxDecoration(color: Color(0xff121b22)),
          child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                var item = filteredData[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(item['name']![0].toUpperCase()),
                    backgroundColor: const Color(0xff00a982),
                  ),
                  title: Text(
                    item['name'].toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    item['message'].toString(),
                    style: const TextStyle(color: Color(0xff738088)),
                  ),
                  trailing: const Text(
                    '1:30 am',
                    style: TextStyle(color: Color(0xff738088)),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
