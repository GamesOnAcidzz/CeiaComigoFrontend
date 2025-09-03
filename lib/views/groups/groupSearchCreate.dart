import 'package:ceia_comigo/views/groups/groupSearchCreateDetails.dart';
import 'package:ceia_comigo/widgets/detailsContainer.dart';
import 'package:ceia_comigo/widgets/groupTextButton.dart';
import 'package:ceia_comigo/widgets/groupTextContainer.dart';
import 'package:ceia_comigo/widgets/groupTimePicker.dart';
import 'package:flutter/material.dart';
import 'package:ceia_comigo/models/restaraunt.dart';
import 'package:ceia_comigo/widgets/counter.dart';

import 'groupSearchRestaurant.dart';

class GroupSearchCreate extends StatefulWidget {
  Restaurant? currentRestaurant;
  //TODO Group currenGroup;
  GroupSearchCreate({super.key});
  @override
  State<GroupSearchCreate> createState() => _GroupSearchCreateState();
}

class _GroupSearchCreateState extends State<GroupSearchCreate> {
  bool isPublic = false;
  bool isLooking = false;
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 11,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                        ),
                        child: Column(
                          children: [
                            GroupTextButton(
                              text: "Look for a place",
                              onPressed: () {
                                setState(() {
                                  isLooking = true;
                                });
                              },
                              icon: Icon(Icons.search),
                            ),
                            if (widget.currentRestaurant != null)
                              Column(
                                children: [
                                  GroupTextContainer(
                                    text: widget.currentRestaurant!.name,
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      DetailsContainer(
                        tabs: [
                          Tab(child: Text("Details"), icon: Icon(Icons.info)),
                          Tab(child: Text("Menu"), icon: Icon(Icons.info)),
                          Tab(child: Text("Discount"), icon: Icon(Icons.info)),
                          Tab(child: Text("Details"), icon: Icon(Icons.info)),
                        ],
                        tabBarViewChildren: [
                          //TODO GroupSearchCreateDetails(),
                          Center(child: Text("PLACEHOLDER")),
                          Center(child: Text("PLACEHOLDER")),
                          Center(child: Text("PLACEHOLDER")),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.secondaryContainer,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "lobby");
                          },
                          child: Text("Create group"),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.errorContainer,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLooking)
          Center(
            heightFactor: 1,
            child: GroupSearchRestaurant(
              onAddPlace: (newRestaurant) {
                setState(() {
                  widget.currentRestaurant = newRestaurant;
                  isLooking = false;
                });
              },
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
