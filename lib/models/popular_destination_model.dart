class PopularDestinationModel {
  String name;
  String country;
  String image;

  PopularDestinationModel(this.name, this.country, this.image);
}

List<PopularDestinationModel> populars = popularsData
    .map((item) =>
        PopularDestinationModel(item['name'], item['country'], item['image']))
    .toList();

var popularsData = [
  {"name": "Sanjeev Sahoo", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},
  {"name": "Ravi Gupta", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},
  {"name": "Sanjeev sahoo", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},

  {"name": "Sanjeev Sahoo", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},
  {"name": "Ravi Gupta", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},
  {"name": "Sanjeev sahoo", "country": "Cardiology specialist", "image": "assets/images/doctor.png"},
];
