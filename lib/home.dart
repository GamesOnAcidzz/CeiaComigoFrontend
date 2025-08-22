import 'package:ceia_comigo/restaurants.dart';
import 'package:ceia_comigo/groups.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabControlller;

  @override
  void initState() {
    super.initState();
    _tabControlller = TabController(length: 3, vsync: this);
    _tabControlller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> selectedColors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Colors.white,
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: TabBarView(
                controller: _tabControlller,
                children: [
                  RestaurantSearch(),
                  GroupSearch(),
                  Container(color: Colors.grey),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBar(
                controller: _tabControlller,
                tabs: [
                  Tab(text: "Restaurants", icon: Icon(Icons.dining)),
                  Tab(text: "Groups", icon: Icon(Icons.group)),
                  Tab(text: "Settings", icon: Icon(Icons.settings)),
                ],
                labelColor: selectedColors[_tabControlller.index],
                indicatorColor: selectedColors[_tabControlller.index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
