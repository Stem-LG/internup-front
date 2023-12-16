class Version {
  final String version;
  final String url;

  Version({required this.version, required this.url});

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(version: json['version'], url: json['url']);
  }

  factory Version.empty() {
    return Version(version: "#.#.#", url: "");
  }
}
