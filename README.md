# WhatsApp Search Bar for Flutter
  WhatsApp Search Bar its a Flutter plugin enable you to build a flexible search bar with buttons filter like WhatsApp Search bar

|<img src="https://raw.githubusercontent.com/mattar88/wp_search_bar/main/example/screenshots/1.png" width="245" hspace="4">
| <img src="https://raw.githubusercontent.com/mattar88/wp_search_bar/main/example/screenshots/2.png" width="245" hspace="4">
|<img src="https://raw.githubusercontent.com/mattar88/wp_search_bar/main/example/screenshots/3.png" width="245" hspace="4">|

## Usage
1.Install Package
With Dart:
```
$ dart pub add wp_search_bar
```
With Flutter:
```
$ flutter pub add wp_search_bar
```
This will add a line like this to you package's pubspec.yaml (and run an implicit `dart pub get`):
```
dependencies:
  wp_search_bar: ^0.1.2
```

2.Define data that you want to show in listview
```
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
```

3.Define Button filters that should use in search bar.
```
var buttonFilters = {
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
        };
```
4.Build the Search bar
 
```
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WPSearchBar(
        listOfFilters: buttonFilters,
        materialDesign: const {
          'title': {'text': 'WhatsApp'},
        },
        onSearch: (filter, value, operation) {
        },
        body: Container(
          decoration: const BoxDecoration(color: Color(0xff121b22)),
          child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                var item = filteredData[index];
                return ListTile(
                  title: Text(
                    item['name'].toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              }),
          ),
      ),
    );
  }
}

```

# To add Sidebar Menu

<table>
  <tr>
    <td align="center">Screenshot 1</td>
    <td align="center">Screenshot 2</td>
  </tr>
  <tr>
    <td><img alt="A Screenshot of WhatsApp Search Bar" src="https://raw.githubusercontent.com/mattar88/wp_search_bar/main/example/screenshots/sidebar_menu_closed.png" width="245"/></td>
    <td><img alt="Another Screenshot of WhatsApp Search Bar" src="https://raw.githubusercontent.com/mattar88/wp_search_bar/main/example/screenshots/sidebar_menu_open.png" width="245"/></td>
  </tr>
 </table>

### use a GlobalKey for scaffold
```
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: SidebarMenu(),
        body: WPSearchBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
          ....
        );
    }
```