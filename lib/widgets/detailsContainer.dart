import 'package:flutter/material.dart';

class DetailsContainer extends StatefulWidget {
  List<Tab> tabs;
  List<Widget> tabBarViewChildren;
  DetailsContainer({required this.tabs, required this.tabBarViewChildren});

  _DetailsContainerState createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  Widget build(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.49,
      child: DefaultTabController(
        length: widget.tabs.length,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TabBar(tabs: widget.tabs),
              Expanded(child: TabBarView(children: widget.tabBarViewChildren)),
            ],
          ),
        ),
      ),
    );
  }
}
