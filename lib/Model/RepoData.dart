// To parse this JSON data, do
//
//     final repoData = repoDataFromJson(jsonString);

import 'dart:convert';

List<RepoData> repoDataFromJson(String str) => new List<RepoData>.from(json.decode(str).map((x) => RepoData.fromJson(x)));

String repoDataToJson(List<RepoData> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class RepoData {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner owner;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String language;
  bool hasIssues;
  bool hasProjects;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  dynamic mirrorUrl;
  bool archived;
  bool disabled;
  int openIssuesCount;
  License license;
  int forks;
  int openIssues;
  int watchers;
  DefaultBranch defaultBranch;

  RepoData({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  factory RepoData.fromJson(Map<String, dynamic> json) => new RepoData(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: Owner.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"] == null ? null : json["description"],
    fork: json["fork"],
    url: json["url"],
    forksUrl: json["forks_url"],
    keysUrl: json["keys_url"],
    collaboratorsUrl: json["collaborators_url"],
    teamsUrl: json["teams_url"],
    hooksUrl: json["hooks_url"],
    issueEventsUrl: json["issue_events_url"],
    eventsUrl: json["events_url"],
    assigneesUrl: json["assignees_url"],
    branchesUrl: json["branches_url"],
    tagsUrl: json["tags_url"],
    blobsUrl: json["blobs_url"],
    gitTagsUrl: json["git_tags_url"],
    gitRefsUrl: json["git_refs_url"],
    treesUrl: json["trees_url"],
    statusesUrl: json["statuses_url"],
    languagesUrl: json["languages_url"],
    stargazersUrl: json["stargazers_url"],
    contributorsUrl: json["contributors_url"],
    subscribersUrl: json["subscribers_url"],
    subscriptionUrl: json["subscription_url"],
    commitsUrl: json["commits_url"],
    gitCommitsUrl: json["git_commits_url"],
    commentsUrl: json["comments_url"],
    issueCommentUrl: json["issue_comment_url"],
    contentsUrl: json["contents_url"],
    compareUrl: json["compare_url"],
    mergesUrl: json["merges_url"],
    archiveUrl: json["archive_url"],
    downloadsUrl: json["downloads_url"],
    issuesUrl: json["issues_url"],
    pullsUrl: json["pulls_url"],
    milestonesUrl: json["milestones_url"],
    notificationsUrl: json["notifications_url"],
    labelsUrl: json["labels_url"],
    releasesUrl: json["releases_url"],
    deploymentsUrl: json["deployments_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pushedAt: DateTime.parse(json["pushed_at"]),
    gitUrl: json["git_url"],
    sshUrl: json["ssh_url"],
    cloneUrl: json["clone_url"],
    svnUrl: json["svn_url"],
    homepage: json["homepage"] == null ? null : json["homepage"],
    size: json["size"],
    stargazersCount: json["stargazers_count"],
    watchersCount: json["watchers_count"],
    language: json["language"],
    hasIssues: json["has_issues"],
    hasProjects: json["has_projects"],
    hasDownloads: json["has_downloads"],
    hasWiki: json["has_wiki"],
    hasPages: json["has_pages"],
    forksCount: json["forks_count"],
    mirrorUrl: json["mirror_url"],
    archived: json["archived"],
    disabled: json["disabled"],
    openIssuesCount: json["open_issues_count"],
    license: json["license"] == null ? null : License.fromJson(json["license"]),
    forks: json["forks"],
    openIssues: json["open_issues"],
    watchers: json["watchers"],
    defaultBranch: defaultBranchValues.map[json["default_branch"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner.toJson(),
    "html_url": htmlUrl,
    "description": description == null ? null : description,
    "fork": fork,
    "url": url,
    "forks_url": forksUrl,
    "keys_url": keysUrl,
    "collaborators_url": collaboratorsUrl,
    "teams_url": teamsUrl,
    "hooks_url": hooksUrl,
    "issue_events_url": issueEventsUrl,
    "events_url": eventsUrl,
    "assignees_url": assigneesUrl,
    "branches_url": branchesUrl,
    "tags_url": tagsUrl,
    "blobs_url": blobsUrl,
    "git_tags_url": gitTagsUrl,
    "git_refs_url": gitRefsUrl,
    "trees_url": treesUrl,
    "statuses_url": statusesUrl,
    "languages_url": languagesUrl,
    "stargazers_url": stargazersUrl,
    "contributors_url": contributorsUrl,
    "subscribers_url": subscribersUrl,
    "subscription_url": subscriptionUrl,
    "commits_url": commitsUrl,
    "git_commits_url": gitCommitsUrl,
    "comments_url": commentsUrl,
    "issue_comment_url": issueCommentUrl,
    "contents_url": contentsUrl,
    "compare_url": compareUrl,
    "merges_url": mergesUrl,
    "archive_url": archiveUrl,
    "downloads_url": downloadsUrl,
    "issues_url": issuesUrl,
    "pulls_url": pullsUrl,
    "milestones_url": milestonesUrl,
    "notifications_url": notificationsUrl,
    "labels_url": labelsUrl,
    "releases_url": releasesUrl,
    "deployments_url": deploymentsUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pushed_at": pushedAt.toIso8601String(),
    "git_url": gitUrl,
    "ssh_url": sshUrl,
    "clone_url": cloneUrl,
    "svn_url": svnUrl,
    "homepage": homepage == null ? null : homepage,
    "size": size,
    "stargazers_count": stargazersCount,
    "watchers_count": watchersCount,
    "language": language,
    "has_issues": hasIssues,
    "has_projects": hasProjects,
    "has_downloads": hasDownloads,
    "has_wiki": hasWiki,
    "has_pages": hasPages,
    "forks_count": forksCount,
    "mirror_url": mirrorUrl,
    "archived": archived,
    "disabled": disabled,
    "open_issues_count": openIssuesCount,
    "license": license == null ? null : license.toJson(),
    "forks": forks,
    "open_issues": openIssues,
    "watchers": watchers,
    "default_branch": defaultBranchValues.reverse[defaultBranch],
  };
}

enum DefaultBranch { MASTER }

final defaultBranchValues = new EnumValues({
  "master": DefaultBranch.MASTER
});

class License {
  String key;
  String name;
  String spdxId;
  dynamic url;
  String nodeId;

  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory License.fromJson(Map<String, dynamic> json) => new License(
    key: json["key"],
    name: json["name"],
    spdxId: json["spdx_id"],
    url: json["url"],
    nodeId: json["node_id"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "spdx_id": spdxId,
    "url": url,
    "node_id": nodeId,
  };
}

class Owner {
  Login login;
  int id;
  NodeId nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  FollowingUrl followingUrl;
  GistsUrl gistsUrl;
  StarredUrl starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  EventsUrl eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  Owner({
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
  });

  factory Owner.fromJson(Map<String, dynamic> json) => new Owner(
    login: loginValues.map[json["login"]],
    id: json["id"],
    nodeId: nodeIdValues.map[json["node_id"]],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: followingUrlValues.map[json["following_url"]],
    gistsUrl: gistsUrlValues.map[json["gists_url"]],
    starredUrl: starredUrlValues.map[json["starred_url"]],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: eventsUrlValues.map[json["events_url"]],
    receivedEventsUrl: json["received_events_url"],
    type: typeValues.map[json["type"]],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": loginValues.reverse[login],
    "id": id,
    "node_id": nodeIdValues.reverse[nodeId],
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrlValues.reverse[followingUrl],
    "gists_url": gistsUrlValues.reverse[gistsUrl],
    "starred_url": starredUrlValues.reverse[starredUrl],
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrlValues.reverse[eventsUrl],
    "received_events_url": receivedEventsUrl,
    "type": typeValues.reverse[type],
    "site_admin": siteAdmin,
  };
}

enum EventsUrl { HTTPS_API_GITHUB_COM_USERS_YASH1200_EVENTS_PRIVACY }

final eventsUrlValues = new EnumValues({
  "https://api.github.com/users/yash1200/events{/privacy}": EventsUrl.HTTPS_API_GITHUB_COM_USERS_YASH1200_EVENTS_PRIVACY
});

enum FollowingUrl { HTTPS_API_GITHUB_COM_USERS_YASH1200_FOLLOWING_OTHER_USER }

final followingUrlValues = new EnumValues({
  "https://api.github.com/users/yash1200/following{/other_user}": FollowingUrl.HTTPS_API_GITHUB_COM_USERS_YASH1200_FOLLOWING_OTHER_USER
});

enum GistsUrl { HTTPS_API_GITHUB_COM_USERS_YASH1200_GISTS_GIST_ID }

final gistsUrlValues = new EnumValues({
  "https://api.github.com/users/yash1200/gists{/gist_id}": GistsUrl.HTTPS_API_GITHUB_COM_USERS_YASH1200_GISTS_GIST_ID
});

enum Login { YASH1200 }

final loginValues = new EnumValues({
  "yash1200": Login.YASH1200
});

enum NodeId { MDQ6_VX_NLCJ_M4_MZKX_N_TCW }

final nodeIdValues = new EnumValues({
  "MDQ6VXNlcjM4MzkxNTcw": NodeId.MDQ6_VX_NLCJ_M4_MZKX_N_TCW
});

enum StarredUrl { HTTPS_API_GITHUB_COM_USERS_YASH1200_STARRED_OWNER_REPO }

final starredUrlValues = new EnumValues({
  "https://api.github.com/users/yash1200/starred{/owner}{/repo}": StarredUrl.HTTPS_API_GITHUB_COM_USERS_YASH1200_STARRED_OWNER_REPO
});

enum Type { USER }

final typeValues = new EnumValues({
  "User": Type.USER
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
