import 'dart:convert';
import 'dart:ui';
import 'package:flutter_login_signup/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Componets/repositories_model.dart';
import 'Componets/list.dart';

Future<Repositories> fetchRepos([bool isfromRefresh = false]) async {
  final response = await http
      .get(Uri.parse('https://api.github.com/search/repositories?q=flutter'));
  print('isfromRefresh: $isfromRefresh');
  print('calll');
  if (response.statusCode == 200) {
    print('200');
    return Repositories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load repos');
  }
}

Widget _glist(AsyncSnapshot<Repositories> futureRepos) {
  return RefreshIndicator(
      child: ListView.builder(
          itemBuilder: (context, int index) {
            var data = futureRepos.data?.items[index];
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
              child: Card(
                color: kGreyColor,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(data?.name ?? 'Unknown',
                        style: const TextStyle(color: Colors.white)),
                  ),
                  subtitle: Text(data?.description ?? 'No description',
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            );
          },
          itemCount: futureRepos.data?.items.length ?? 0),
      onRefresh: HomePage()._handleRefresh);
}

class HomePage extends State<ListPage> {
  late Future<Repositories> futureRepos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      body: Center(
          child: FutureBuilder<Repositories>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _glist(snapshot);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      )),
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

  Future<void> _handleRefresh() async {
    print('refreeeeee');
    // setState(() {
    fetchRepos(true);
    // });
    return null;
  }

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
