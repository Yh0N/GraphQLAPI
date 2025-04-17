import 'package:app_graphql/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  final client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
  );

  final ValueNotifier<GraphQLClient> clientNotifier = ValueNotifier(client);

  runApp(
    GraphQLProvider(
      client: clientNotifier,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), 
      ),
    ),
  );
}
