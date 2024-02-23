class OrganizationModel {
  String name;
  String address;
  String phone;
  String email;
  String website;
  String logo;
  String description;
  String id;

  OrganizationModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.website,
    required this.logo,
    required this.description,
    required this.id,
  });

  fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "No Name";
    address = json['address'] ?? "No Address";
    phone = json['phone'] ?? "No Phone";
    email = json['email'] ?? "No Email";
    website = json['website'] ?? "No Website";
    logo = json['logo'] ?? "No Logo";
    description = json['description'] ?? "No Description";
    id = json['id'] ?? "No ID";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['website'] = website;
    data['logo'] = logo;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}
