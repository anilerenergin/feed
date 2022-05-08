class ProfileModel {
  String? name;
  String? location;
  String? id;
  String? profileImg;
  ProfileModel({
    this.id,
    this.location,
    this.name,
    this.profileImg,
  });
}

List<ProfileModel> profiles = [
  ProfileModel(
      name: "Sanem Ekin",
      id: "0",
      location: "Londra",
      profileImg:
          "http://www.woman-themovie.org/wp-content/uploads/2020/02/CHAUD_Celine-W_78-FRANCE_24-FACIES-LVMH-CALLIGARO_Sandra-V.jpg"),
  ProfileModel(
      name: "Banu Karasu",
      id: "1",
      location: "Berlin",
      profileImg:
          "http://www.woman-themovie.org/wp-content/uploads/2020/02/CHAUD_Celine-W_78-FRANCE_24-FACIES-LVMH-CALLIGARO_Sandra-V.jpg"),
  ProfileModel(
      name: "Recep Baltaş",
      id: "2",
      location: "Berlin",
      profileImg:
          "http://www.woman-themovie.org/wp-content/uploads/2020/02/CHAUD_Celine-W_78-FRANCE_24-FACIES-LVMH-CALLIGARO_Sandra-V.jpg"),
  ProfileModel(
      name: "Arda Tamahkaroğlu",
      id: "3",
      location: "İstanbul",
      profileImg:
          "http://www.woman-themovie.org/wp-content/uploads/2020/02/CHAUD_Celine-W_78-FRANCE_24-FACIES-LVMH-CALLIGARO_Sandra-V.jpg"),
  ProfileModel(
      name: "Araz Alem",
      id: "4",
      location: "İstanbul",
      profileImg:
          "http://www.woman-themovie.org/wp-content/uploads/2020/02/CHAUD_Celine-W_78-FRANCE_24-FACIES-LVMH-CALLIGARO_Sandra-V.jpg"),
          
];
