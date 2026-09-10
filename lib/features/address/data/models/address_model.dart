class AddressModel {
  final String id;
  final String name;
  final String phone;
  final String country;
  final String state;
  final String city;
  final String villageArea;
  final String pin;
  final String address;
  final String landmark;
  final String addressType;
  final bool isDefault;

  const AddressModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.country,
    required this.state,
    required this.city,
    required this.villageArea,
    required this.pin,
    required this.address,
    required this.landmark,
    required this.addressType,
    this.isDefault = false,
  });

  AddressModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? country,
    String? state,
    String? city,
    String? villageArea,
    String? pin,
    String? address,
    String? landmark,
    String? addressType,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      villageArea: villageArea ?? this.villageArea,
      pin: pin ?? this.pin,
      address: address ?? this.address,
      landmark: landmark ?? this.landmark,
      addressType: addressType ?? this.addressType,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
