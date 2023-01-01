import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wp_search_bar/wp_search_bar.dart';

void main() {
  runApp(const MyApp());
}

abstract class StatusEnum {
  ///Reached Whatsapp Servers
  static String rcs = "RCS";

  ///Reached Other Person
  static String rcp = "RCP";

  ///Read By other Person
  static String rdp = "RDP";
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> data = [
    {'name': "Mohammad", 'message': "message from mhammad", 'status': 'RDP'},
    {'name': "Kamel", 'message': "message from kamel", 'status': 'RDP'},
    {'name': "Nadine", 'message': "how are you ?", 'status': 'RCP'},
    {'name': "Joseph", 'message': "hello...!", 'status': 'RCS'},
    {'name': "71966691", 'message': "Hi", 'status': 'RCP'},
    {'name': "03405609", 'message': "hiiii....", 'status': 'RCP'},
    {'name': "Mohammad", 'message': "message from mhammad", 'status': 'RCP'},
    {'name': "Kamel", 'message': "Hi mohammad", 'status': 'RCP'},
    {'name': "Nadine", 'message': "I am busy", 'status': 'RCS'},
    {'name': "Joseph", 'message': "hello there...!", 'status': 'RCP'},
    {'name': "71966691", 'message': "Hi there", 'status': 'RCS'},
    {'name': "03405609", 'message': "", 'status': 'RCS'},
  ];
  List<Map<String, dynamic>> filteredData = [];
  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WPSearchBar(
        appBarBackgroundColor: const Color(0xff1f2c34),
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
            'icon': Icon(Icons.message),
          },
          'read_by_person': {
            'name': 'read_by_person',
            'selected': false,
            'title': 'Read by Other Person',
            'operation': 'CONTAINS',
            'icon': Icon(
              Icons.checklist_sharp,
              color: Colors.blue,
            ),
          },
          'date': {
            'name': 'Date',
            'selected': false,
            'title': 'Date',
            'operation': 'CONTAINS',
            'icon': Icon(Icons.date_range),
          },
        },
        materialDesign: const {
          'title': {'text': 'WhatsApp'},
        },
        onChangeFilter: (filterName, selected, filterObject) {
          return true;
        },
        onSearch: (filterSelected, value, operation) {
          // log('${this.data}');
          filteredData = data.where((Map<String, dynamic> element) {
            // log('Element----');
            var dataKey = filterSelected;
            log('Element  ${element[filterSelected]}, filter: ${filterSelected}, value: ${value}');

            if (dataKey != null) {
              if (dataKey == 'read_by_person') {
                dataKey = 'name';
                if (element['status'] == null ||
                    element['status'] != (StatusEnum.rdp)) {
                  return false;
                }
              }
            }

            if (value == null || value == '') {
              return true;
            }

            log('Element2  ${element[dataKey]}, filter: ${dataKey}, value: ${value}');
            if (dataKey != null &&
                element[dataKey] != null &&
                element[dataKey]!.toLowerCase().contains(value.toLowerCase())) {
              return true;
            } else {
              if (element['name']!
                      .toLowerCase()
                      .contains(value.toLowerCase()) ||
                  element['message']!
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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['message'].toString(),
                        style: const TextStyle(color: Color(0xff738088)),
                      ),
                      if (item['status'] == StatusEnum.rdp)
                        const Icon(
                          Icons.checklist_sharp,
                          color: Colors.blue,
                        ),
                      if (item['status'] == StatusEnum.rcs)
                        const Icon(
                          Icons.checklist_sharp,
                          color: Colors.grey,
                        ),
                      if (item['status'] == StatusEnum.rcp)
                        const Icon(Icons.check, color: Colors.grey, size: 16),
                    ],
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
