import 'package:flutter/material.dart';
import 'package:petinder/events/app_state.dart';
import 'package:petinder/events/event.dart';
import 'package:petinder/events/event_details_page.dart';
import 'package:petinder/style/category.dart';
import 'package:petinder/style/category_widget.dart';
import 'package:petinder/style/event_widget.dart';
import 'package:provider/provider.dart';
class AdoptionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Consumer<AppState>(
                          builder: (context, appState, _) =>
                              SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                for (final category in categories)
                                  CategoryWidget(category: category)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Consumer<AppState>(
                          builder: (context, appState, _) => Column(
                            children: <Widget>[
                              for (final event in events.where((e) => e
                                  .categoryIds
                                  .contains(appState.selectedCategoryId)))
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsPage(event: event),
                                      ),
                                    );
                                  },
                                  child: EventWidget(
                                    event: event,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
