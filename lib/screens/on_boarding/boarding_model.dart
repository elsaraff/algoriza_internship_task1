class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/images/Combo.svg',
      title: 'Hot Offers',
      body: 'Get the discount and save up to 30% when order and pay online.'),
  BoardingModel(
      image: 'assets/images/delivery.svg',
      title: 'Fast Delivery',
      body:
          'Your food will be delivered to your doorstep as fast as possible.'),
  BoardingModel(
      image: 'assets/images/Chef.svg',
      title: 'Best Restaurant',
      body:
          'You can order from your favourite restaurant and around your area carefully selected.'),
];
