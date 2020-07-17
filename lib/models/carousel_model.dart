class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
 // {"image": "assets/images/offer2.jpeg"},
  {"image": "assets/images/offer2.jpg"},
  {"image": "assets/images/offer.jpg"},
  {"image": "assets/images/of.jpeg"},

];
