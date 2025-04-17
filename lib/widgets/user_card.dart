import 'package:flutter/material.dart';
import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Mejor espaciado
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: user.image.isNotEmpty 
              ? NetworkImage(user.image) 
              : const AssetImage('assets/placeholder.png') as ImageProvider,
          onBackgroundImageError: (_, __) => const AssetImage('assets/placeholder.png'),
        ),
        title: Text(
          user.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          user.species,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}