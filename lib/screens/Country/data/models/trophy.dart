class Trophy {
  Trophy({
    required this.name,
    required this.count,
  });

  String name;
  int count;

  Trophy.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        count = json['count'];
}