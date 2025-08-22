import 'package:flutter/material.dart';

class RestaurantSearch extends StatefulWidget {
  @override
  _RestaurantSearchState createState() => _RestaurantSearchState();
}

class _RestaurantSearchState extends State<RestaurantSearch> {
  List<RestarauntPlaceholder> restaraunts = [
    RestarauntPlaceholder(name: "Sole Mio", publicGroups: 2),
    RestarauntPlaceholder(name: "Turkish"),
    RestarauntPlaceholder(name: "Fim do Mundo"),
    RestarauntPlaceholder(name: "Joans", publicGroups: 3),
    RestarauntPlaceholder(name: "Sole Mio"),
    RestarauntPlaceholder(name: "Turkish"),
    RestarauntPlaceholder(name: "Fim do Mundo", publicGroups: 3),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
    RestarauntPlaceholder(name: "Joans"),
  ];
  bool topBarVisible = false;
  String topBarTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Look for a place"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20,
              ),
              itemCount: restaraunts.length,
              itemBuilder: (context, index) {
                final restaurant = restaraunts[index];
                return RestItem(
                  name: restaraunts[index].name,
                  publicGroups: restaraunts[index].publicGroups,
                  onTap: (name) {
                    setState(() {
                      topBarTitle = name;
                      topBarVisible = true;
                    });
                  },
                );
              },
            ),
          ),
          if (topBarVisible)
            Center(
              heightFactor: 1,
              child: RestTopBar(
                name: topBarTitle,
                onClose: () {
                  setState(() {
                    topBarVisible = false;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}

class RestarauntPlaceholder {
  String name;
  int publicGroups = 0;
  RestarauntPlaceholder({required this.name, this.publicGroups = 0});
}

class RestItem extends StatelessWidget {
  final String name;
  final int publicGroups;
  final void Function(String name)? onTap;

  RestItem({required this.name, this.publicGroups = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTap!(name)},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Visibility(
              visible: true ? publicGroups > 0 : false,
              child: Container(
                margin: EdgeInsets.all(4),
                child: Column(
                  children: [Icon(Icons.groups), Text("$publicGroups")],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 5, child: Icon(Icons.lunch_dining)),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Text(name),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RestTopBar extends StatelessWidget {
  String name;

  final void Function()? onClose;
  RestTopBar({required this.name, this.onClose});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.95,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Text(name, style: TextStyle(fontSize: 24)),
            TabBar(
              tabs: [
                Tab(text: "Details", icon: Icon(Icons.restaurant)),
                Tab(text: "Menu", icon: Icon(Icons.restaurant_menu_sharp)),
                Tab(text: "Discounts", icon: Icon(Icons.discount)),
                Tab(text: "Public Groups", icon: Icon(Icons.groups)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                ],
              ),
            ),
            IconButton.outlined(
              onPressed: () {
                onClose!();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
