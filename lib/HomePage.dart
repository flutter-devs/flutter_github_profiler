import 'package:flutter/material.dart';
import 'package:github_flutter_ui/Model/GithubUser.dart';
import 'package:github_flutter_ui/Model/listItem.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:github_flutter_ui/Model/RepoData.dart';

class HomePage extends StatefulWidget {
  String username;

  HomePage({Key key, @required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(username: username);
}

class _HomePageState extends State<HomePage> {
  String username;

  _HomePageState({Key key, @required this.username});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  List<listItem> repoList;

  @override
  void initState() {
    super.initState();
  }

  Future<GithubUser> getUserData() async {
    GithubUser user;
    String url = "https://api.github.com/users/$username";
    http.Response response = await http.get(url);
    user = githubUserFromJson(response.body);
    return user;
  }

  Future<List<RepoData>> getRepoData() async {
    List<RepoData> repo = List<RepoData>();
    String url = 'https://api.github.com/users/$username/repos';
    http.Response response = await http.get(url);
    repo = repoDataFromJson(response.body);
    print(repo);
    return repo;
  }

  repoLIstItem(BuildContext context, RepoData repoData) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 10,
            child: ListTile(
              onTap: () {
                _launchURL(repoData.htmlUrl);
              },
              title: Text(repoData.name),
              leading: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              subtitle: Text(
                repoData.description ?? "",
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                children: <Widget>[
                  Icon(Icons.star_border),
                  Text(repoData.stargazersCount.toString()),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(left: 100,bottom: 250,
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  child: Image.asset(
                    'assets/Octocat.png',
                    height: 600,
                    width: 600,
                  ),
                ),
              ),
            ),
            FutureBuilder<GithubUser>(
              future: getUserData(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(Icons.arrow_back)),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black, width: 3)),
                                        child: ClipOval(
                                          child: CircleAvatar(
                                            radius: 70,
                                            child: Image.network(
                                                '${snapshot.data.avatarUrl}'),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: InkWell(
                                          onTap: () {
                                            _launchURL(snapshot.data.htmlUrl);
                                          },
                                          child: Image.asset(
                                            'assets/GitHub-Mark-64px.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '${snapshot.data.name}',
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.w300),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: snapshot.data.bio != null
                                      ? Text(
                                          snapshot.data.bio,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        )
                                      : SizedBox(
                                          height: 0,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: snapshot.data.email != null
                                      ? Text(
                                          snapshot.data.email,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        )
                                      : SizedBox(
                                          height: 0,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height / 10,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height / 10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                child: Icon(
                                                  Icons.folder_open,
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(snapshot.data.publicRepos
                                                    .toString()),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(
                                                  'Repositories',
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height / 10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                child: Icon(
                                                  Icons.people,
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(snapshot.data.followers
                                                    .toString()),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(
                                                  'Followers',
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height / 10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    20,
                                                child: Icon(
                                                  Icons.person_outline,
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(snapshot.data.following
                                                    .toString()),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                child: Text(
                                                  'Following',
                                                  style: TextStyle(fontSize: 12),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: ListView(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(left: 20, top: 15),
                                          child: Text(
                                            'Joined : ${DateFormat.yMMMd().format(snapshot.data.createdAt)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 22),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 15, bottom: 15),
                                          child: Text(
                                            'Last update : ${DateFormat.yMMMd().format(snapshot.data.updatedAt)}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 20, top: 10, bottom: 10),
                                  child: Text(
                                    'Repositories',
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: FutureBuilder<List<RepoData>>(
                                      future: getRepoData(),
                                      builder: (context, snapshot1) {
                                        if (!snapshot1.hasData) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if (snapshot1.hasData) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Colors.grey, width: 0.5)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, bottom: 4),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: NeverScrollableScrollPhysics(),
                                                itemCount: snapshot1.data.length,
                                                itemBuilder: (context, index) {
                                                  return repoLIstItem(
                                                      context, snapshot1.data[index]);
                                                },
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Center(
                                            child: Container(
                                              width:
                                                  MediaQuery.of(context).size.width,
                                              height:
                                                  MediaQuery.of(context).size.height /
                                                      10,
                                              child: Text('No Repositories Found'),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/giterror.png'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'User Not Found',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          child: Text(
                            'Back To Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
