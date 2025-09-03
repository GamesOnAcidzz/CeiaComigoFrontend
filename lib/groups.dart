import 'package:ceia_comigo/views/groups/groupLobby.dart';
import 'package:ceia_comigo/views/groups/groupSearchCreate.dart';
import 'package:flutter/material.dart';
import '../widgets/counter.dart';
import 'package:ceia_comigo/models/restaraunt.dart';

class GroupSearch extends StatefulWidget {
  @override
  _GroupSearchState createState() => _GroupSearchState();
}

class _GroupSearchState extends State<GroupSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find or make a group"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Navigator(
        initialRoute: 'home',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'home':
              builder = (_) => GroupSearchHome();
              break;
            case 'create':
              builder = (_) => GroupSearchCreate();
              break;
            case 'lobby':
              builder = (_) => GroupLobby();
              break;
            default:
              builder = (_) => GroupSearchHome();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}

class GroupSearchHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: double.infinity,
                          child: GroupSearchButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, "create"),
                            },
                            name: "Create",
                            icon: Icons.add_box,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: double.infinity,
                          child: GroupSearchButton(
                            onPressed: () => {},
                            name: "Find",
                            icon: Icons.search,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: double.infinity,
                          child: GroupSearchButton(
                            onPressed: () => {},
                            name: "Join",
                            icon: Icons.groups,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupSearchButton extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final IconData icon;

  GroupSearchButton({
    required this.onPressed,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.secondary),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}

class GroupSearchRestaurant extends StatefulWidget {
  final void Function()? onClose;
  final void Function(Restaurant) onAddPlace;
  GroupSearchRestaurant({required this.onClose, required this.onAddPlace});

  @override
  _GroupSearchRestaurantState createState() => _GroupSearchRestaurantState();
}

class _GroupSearchRestaurantState extends State<GroupSearchRestaurant> {
  List<Restaurant> restaraunts = [
    Restaurant(name: "Sole Mio"),
    Restaurant(name: "Turkish"),
    Restaurant(name: "Fim do Mundo"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Sole Mio"),
    Restaurant(name: "Turkish"),
    Restaurant(name: "Fim do Mundo"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
    Restaurant(name: "Joans"),
  ];

  List<Restaurant> searchedRestaraunts = [];
  TextEditingController searchController = TextEditingController();
  bool isDetails = false;
  late Restaurant currentRestaurant;
  @override
  void initState() {
    super.initState();
    searchedRestaraunts = restaraunts;
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.95,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SearchBar(
                        controller: searchController,
                        hintText: 'Search...',
                        leading: Icon(Icons.search),
                        onChanged: (query) {
                          setState(() {
                            searchedRestaraunts = restaraunts
                                .where(
                                  (r) => r.name.toLowerCase().contains(
                                    query.toLowerCase(),
                                  ),
                                )
                                .toList();
                            // Update search results
                          });
                        },
                        trailing: [
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              setState(() {
                                searchedRestaraunts = restaraunts;
                                searchController.clear();
                              });
                              // Clear search
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: searchedRestaraunts.length,
                        padding: EdgeInsets.all(20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          final restaurant = searchedRestaraunts[index];
                          return SearchRestItem(
                            restaurant: restaurant,
                            onTap: (searchRestaurant) {
                              setState(() {
                                currentRestaurant = searchRestaurant;
                                isDetails = true;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (isDetails)
                  GroupSearchRestaurantDetails(
                    restaurant: currentRestaurant,
                    onLookAnotherPlace: () {
                      setState(() {
                        isDetails = false;
                      });
                    },
                    onAddPlace: (new_restaurant) {
                      setState(() {
                        widget.onAddPlace(new_restaurant);
                      });
                    },
                  ),
              ],
            ),
          ),
          IconButton.outlined(
            style: ButtonStyle(),
            onPressed: () {
              widget.onClose!();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

class GroupSearchRestaurantDetails extends StatefulWidget {
  late Restaurant restaurant;
  final void Function() onLookAnotherPlace;
  final void Function(Restaurant) onAddPlace;

  GroupSearchRestaurantDetails({
    required this.restaurant,
    required this.onLookAnotherPlace,
    required this.onAddPlace,
  });

  _GroupSearchRestaurantDetailsState createState() =>
      _GroupSearchRestaurantDetailsState();
}

class _GroupSearchRestaurantDetailsState
    extends State<GroupSearchRestaurantDetails> {
  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Column(
        children: [
          Text(
            widget.restaurant.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          TabBar(
            labelColor: Theme.of(context).colorScheme.secondary,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
            tabs: [
              Tab(text: "Details", icon: Icon(Icons.restaurant)),
              Tab(text: "Menu", icon: Icon(Icons.restaurant_menu)),
              Tab(text: "Discounts", icon: Icon(Icons.discount)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(width: double.infinity, color: Colors.white),
                Container(width: double.infinity, color: Colors.white),
                Container(width: double.infinity, color: Colors.white),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                widget.onAddPlace(widget.restaurant);
              },
              child: Text(
                "Add place",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondaryFixedDim,
                ),
              ),
              onPressed: () {
                widget.onLookAnotherPlace();
              },
              child: Text(
                "Look for another place",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchRestItem extends StatelessWidget {
  final Restaurant restaurant;
  final void Function(Restaurant name)? onTap;

  SearchRestItem({required this.restaurant, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTap!(restaurant)},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            /*Visibility(
              visible: true ? restaurant.groups != null : false,
              child: Container(
                margin: EdgeInsets.all(4),
                child: Column(
                  children: [
                    Icon(Icons.groups),
                    Text("${restaurant.groups!.length}"),
                  ],
                ),
              ),
            ),
            */
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 5, child: Icon(Icons.lunch_dining)),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).colorScheme.secondaryFixedDim,
                    child: Text(restaurant.name),
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
