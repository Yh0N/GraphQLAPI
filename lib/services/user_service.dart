import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/user.dart';

class UserService {
  static Future<List<User>> fetchUsers(GraphQLClient client) async {
    const String query = r'''
      query {
        characters(page: 1) {
          results {
            id
            name
            status
            species
            gender
            image
          }
        }
      }
    ''';

    final result = await client.query(
      QueryOptions(document: gql(query)),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final List usersData = result.data?['characters']['results'] ?? [];

    return usersData.map((json) => User.fromJson(json)).toList();
  }
}
