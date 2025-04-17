import 'package:app_graphql/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/user.dart';


class UserController extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;

  Future<void> loadUsers(GraphQLClient client) async {
    isLoading = true;
    notifyListeners();

    try {
      users = await UserService.fetchUsers(client);
    } catch (e) {
      print("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
