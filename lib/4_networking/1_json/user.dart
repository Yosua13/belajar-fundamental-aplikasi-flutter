class User {
  final num id;
  final String name;
  final String address;
  final List<String> hobbies;
  final SocialMedia socialMedia;

  User({
    required this.id,
    required this.name,
    required this.address,
    required this.hobbies,
    required this.socialMedia,
  });

  /// proses memecahkan json menjadi satuan yang lebih kecil
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as num,
        name: json['name'] as String,
        address: json['address'] as String,
        hobbies: List<String>.from(json["hobbies"].map((x) => x)),
        socialMedia: SocialMedia.fromJson(json["social_media"]),
      );

  /// proses menggabungkan beberapa objek atau modul menjadi satu
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
      };
}

class SocialMedia {
  final String instagram;
  final String twitter;

  SocialMedia({
    required this.instagram,
    required this.twitter,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        instagram: json["instagram"],
        twitter: json["twitter"],
      );
}
