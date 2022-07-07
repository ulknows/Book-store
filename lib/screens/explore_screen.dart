import 'package:flutter/material.dart';

import '../api/mock_data_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class ExploreScreen extends StatelessWidget {

  final mockService = MockDataService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              MostRecentListView(booklist: snapshot.data?.todayRecipes ?? []),
              BookListView(allBook: snapshot.data?.todayRecipes ?? [])
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
