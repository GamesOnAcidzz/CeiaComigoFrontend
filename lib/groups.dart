import 'package:flutter/material.dart';
import '../restaurants.dart';

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
                        flex: 1,
                        child: Text(
                          "Public",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
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
                            name: "Join",
                            icon: Icons.groups,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
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
                        flex: 1,
                        child: Text(
                          "Private",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: double.infinity,
                          child: GroupSearchButton(
                            onPressed: () => {},
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

class GroupSearchCreate extends StatefulWidget {
  @override
  State<GroupSearchCreate> createState() => _GroupSearchCreateState();
}

class _GroupSearchCreateState extends State<GroupSearchCreate> {
  bool isPublic = false;
  bool isLooking = false;
  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SegmentedButton(
                  segments: const <ButtonSegment<bool>>[
                    ButtonSegment(value: false, label: Text("Private")),
                    ButtonSegment(value: true, label: Text("Public")),
                  ],
                  selected: <bool>{isPublic},
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      isPublic = newSelection.first;
                    });
                  },
                ),
                if (isPublic)
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hint: Text("Name of the group"),
                    ),
                    obscureText: true,
                  ),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  onPressed: () => {
                    setState(() {
                      isLooking = true;
                    }),
                  },
                  label: Text("Look for a place"),
                  icon: Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
        if (isLooking)
          Center(
            heightFactor: 1,
            child: GroupSearchRestaurant(
              onClose: () => {
                setState(() {
                  isLooking = false;
                }),
              },
            ),
          ),
      ],
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
  GroupSearchRestaurant({required this.onClose});

  @override
  _GroupSearchRestaurantState createState() => _GroupSearchRestaurantState();
}

class _GroupSearchRestaurantState extends State<GroupSearchRestaurant> {
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

  List<RestarauntPlaceholder> searchedRestaraunts = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchedRestaraunts = restaraunts;
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
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
          SearchBar(
            controller: searchController,
            hintText: 'Search...',
            leading: Icon(Icons.search),
            onChanged: (query) {
              setState(() {
                searchedRestaraunts = restaraunts
                    .where(
                      (r) => r.name.toLowerCase().contains(query.toLowerCase()),
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
                return RestItem(
                  name: searchedRestaraunts[index].name,
                  publicGroups: searchedRestaraunts[index].publicGroups,
                  onTap: (name) {},
                );
              },
            ),
          ),
          IconButton.outlined(
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
          color: Theme.of(context).colorScheme.secondaryContainer,
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
                    color: Theme.of(context).colorScheme.onSecondary,
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
