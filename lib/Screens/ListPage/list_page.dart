import 'dart:convert';
import 'package:flutter_login_signup/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Componets/repositories_model.dart';

Future<Repositories> fetchRepos() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/search/repositories?q=flutter'));
  print('calll');
  if (response.statusCode == 200) {
    print('200');
    return Repositories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class HomePage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(),
      appBar: AppBar(
        backgroundColor: kBGColor,
        title: const Text(
          "Repos",
        ),
        elevation: 4.0,
        centerTitle: true,
      ),
    );
  }

  late Future<Repositories> futureRepos;

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos();
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}
