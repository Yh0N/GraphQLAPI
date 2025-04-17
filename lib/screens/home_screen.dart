import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import '../widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = GraphQLProvider.of(context).value;

    return ChangeNotifierProvider(
      create: (_) => UserController()..loadUsers(client),
      child: Scaffold(
        appBar: AppBar(title: const Text("Rick & Morty Characters")),
        body: Consumer<UserController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return UserCard(user: controller.users[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
