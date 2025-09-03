import 'package:ceia_comigo/models/restaraunt.dart';
import 'package:ceia_comigo/models/user_client.dart';
import 'package:ceia_comigo/models/user_session.dart';
import 'package:ceia_comigo/widgets/detailsContainer.dart';
import 'package:ceia_comigo/widgets/groupTextButton.dart';
import 'package:ceia_comigo/widgets/groupTextContainer.dart';
import 'package:flutter/material.dart';
import 'package:ceia_comigo/models/group.dart';

class GroupLobby extends StatefulWidget {
  Group groupPlaceholder = Group(
    host: UserClient(id: 0, name: "Luis"),
    isPublic: false,
    members: List.of([
      UserClient(id: 0, name: "Joana"),
      UserClient(id: 1, name: "Maria"),
      UserClient(id: 2, name: "Carlos"),
    ]),
  );

  _GroupLobbyState createState() => _GroupLobbyState();
}

class _GroupLobbyState extends State<GroupLobby> {
  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.secondary,
      child: Expanded(
        child: Column(
          children: [
            GroupTextContainer(text: "Restaurant", fontSize: 20),
            SizedBox(height: 10),
            GroupTextContainer(text: "RESTAURANTPLACEHOLDER"),
            SizedBox(height: 20),
            DetailsContainer(
              tabs: [
                Tab(
                  child: Text("Members", style: TextStyle(fontSize: 8)),
                  icon: Icon(Icons.groups),
                ),
                Tab(
                  child: Text("Chat", style: TextStyle(fontSize: 8)),
                  icon: Icon(Icons.chat),
                ),
                Tab(
                  child: Text("Details", style: TextStyle(fontSize: 8)),
                  icon: Icon(Icons.details),
                ),
                Tab(
                  child: Text("Members", style: TextStyle(fontSize: 10)),
                  icon: Icon(Icons.groups),
                ),
                Tab(
                  child: Text("Members", style: TextStyle(fontSize: 10)),
                  icon: Icon(Icons.groups),
                ),
              ],
              tabBarViewChildren: [
                Center(child: Text("Members area")),
                Center(child: Text("Members area")),
                Center(child: Text("Members area")),
                Center(child: Text("Members area")),
              ],
            ),
            /*GroupTimePicker(
              title: "Current schedule",
              onTimePicked: (datePicked, timePicked) {},
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 9,
              child: GroupLobbyMembers(group: widget.groupPlaceholder),
            ),
            */
            SizedBox(height: 20),

            GroupTextButton(
              text: "Confirm reservation",
              onPressed: () {},
              isFullWIdth: true,
            ),

            SizedBox(height: 10),
            GroupTextButton(
              text: "Cancel group",
              onPressed: () {
                final outerContext = context;
                showDialog(
                  context: outerContext,
                  builder: (BuildContext dialogContext) {
                    List<String> words = [
                      "pizza",
                      "cheese",
                      "bread",
                      "onion",
                      "pasta",
                      "sushi",
                    ];
                    words.shuffle();
                    TextEditingController _controller = TextEditingController();
                    return AlertDialog(
                      title: Text("Cancel reservation?"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Type the following word to cancel the reservation",
                          ),
                          GroupTextContainer(text: words.first, fontSize: 24),
                          TextField(controller: _controller),
                        ],
                      ),
                      actions: [
                        GroupTextButton(
                          text: "Submit",
                          onPressed: () {
                            if (_controller.text == words.first) {
                              Navigator.of(dialogContext).pop();
                              Navigator.pushNamed(outerContext, "home");
                            }
                          },
                        ),
                        GroupTextButton(
                          text: "Cancel",
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              isFullWIdth: true,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupLobbyMembers extends StatefulWidget {
  Group group;

  GroupLobbyMembers({required this.group});

  _GroupLobbyMembersState createState() => _GroupLobbyMembersState();
}

class _GroupLobbyMembersState extends State<GroupLobbyMembers> {
  @override
  Widget build(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            GroupLobbyMemberItem(name: widget.group.host.name, isHost: true),
            Expanded(
              child: ListView.builder(
                itemCount: widget.group.members!.length,
                itemBuilder: (context, index) {
                  return GroupLobbyMemberItem(
                    name: widget.group.members![index].name,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GroupLobbyMemberItem extends StatelessWidget {
  String name;
  bool isHost = false;

  GroupLobbyMemberItem({required this.name, this.isHost = false});

  @override
  Widget build(context) {
    return Container(
      color: isHost
          ? Theme.of(context).colorScheme.secondaryContainer.withBlue(80)
          : Theme.of(context).colorScheme.secondaryContainer,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.person_rounded),
              Text(name),
              TextButton(
                onPressed: () {},
                child: Text(isHost ? "HOST" : 'KICK'),
              ),
            ],
          ),
          Divider(height: 10, color: Theme.of(context).colorScheme.shadow),
        ],
      ),
    );
  }
}

class GroupLobbyRestaurantDetails extends StatefulWidget {
  late Restaurant restaurant;
  final void Function() onLookAnotherPlace;
  final void Function(Restaurant) onAddPlace;

  GroupLobbyRestaurantDetails({
    required this.restaurant,
    required this.onLookAnotherPlace,
    required this.onAddPlace,
  });

  _GroupLobbyRestaurantDetailsState createState() =>
      _GroupLobbyRestaurantDetailsState();
}

class _GroupLobbyRestaurantDetailsState
    extends State<GroupLobbyRestaurantDetails> {
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
                  Theme.of(context).colorScheme.secondaryFixedDim,
                ),
              ),
              onPressed: () {
                widget.onLookAnotherPlace();
              },
              child: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
            ),
          ),
        ],
      ),
    );
  }
}
