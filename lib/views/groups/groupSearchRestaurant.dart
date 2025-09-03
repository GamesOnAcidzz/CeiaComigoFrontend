import 'package:ceia_comigo/groups.dart';
import 'package:flutter/material.dart';
import 'package:ceia_comigo/models/restaraunt.dart';

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
