import 'dart:convert';
import 'package:flutter_login_signup/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Componets/repositories_model.dart';

Future<Repositories> fetchRepos([bool isfromRefresh = false]) async {
  var url = isfromRefresh
      ? 'https://api.github.com/search/repositories?q=flutter'
      : 'https://api.github.com/search/repositories?q=swift';
  final response = await http.get(Uri.parse(url));
  print('isfromRefresh: $isfromRefresh');
  print(url);
  if (response.statusCode == 200) {
    print('200');
    return Repositories.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load repos');
  }
}

class HomePage extends State<ListPage> {
  late Future<Repositories> futureRepos;
  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    print("building...");
    return Scaffold(
      backgroundColor: kBGColor,
      body: Center(
          child: FutureBuilder<Repositories>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data?.items[0].name);
            return _glist(snapshot);
          } else if (snapshot.hasError) {
            print('snapshot.hasError');
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
        onRefresh: _handleRefresh);
  }

  Future<void> _handleRefresh() async {
    setState(() {
      futureRepos = fetchRepos();
      //  fetchRepos(true);
    });
    return;
  }
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  HomePage createState() => HomePage();
}
