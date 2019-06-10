// To parse this JSON data, do
//
//     final githubUser = githubUserFromJson(jsonString);

import 'dart:convert';

GithubUser githubUserFromJson(String str) => GithubUser.fromJson(json.decode(str));

String githubUserToJson(GithubUser data) => json.encode(data.toJson());

class GithubUser {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
  String name;
  dynamic company;
  String blog;
  String location;
  dynamic email;
  dynamic hireable;
  dynamic bio;
  int publicRepos;
  int publicGists;  
  int followers;
  int following;
  DateTime createdAt;
  DateTime updatedAt;

  GithubUser({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  factory GithubUser.fromJson(Map<String, dynamic> json) => new GithubUser(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: json["type"],
    siteAdmin: json["site_admin"],
    name: json["name"],
    company: json["company"],
    blog: json["blog"],
    location: json["location"],
    email: json["email"],
    hireable: json["hireable"],
    bio: json["bio"],
    publicRepos: json["public_repos"],
    publicGists: json["public_gists"],
    followers: json["followers"],
    following: json["following"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": type,
    "site_admin": siteAdmin,
    "name": name,
    "company": company,
    "blog": blog,
    "location": location,
    "email": email,
    "hireable": hireable,
    "bio": bio,
    "public_repos": publicRepos,
    "public_gists": publicGists,
    "followers": followers,
    "following": following,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
