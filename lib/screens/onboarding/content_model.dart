class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Nekolist',
      image: 'https://static.zerochan.net/Nyarlko.full.1273400.jpg',
      discription: "Тут ти зможеш вести список любимих аніме і манг."
  ),
  UnbordingContent(
      title: 'Однодумці',
      image: 'https://static.zerochan.net/Uruha.Rushia.full.3049348.png',
      discription: "Ти зможеш ділитись власним списком або переглядати чужий."
  ),
  UnbordingContent(
      title: 'Контент',
      image: 'https://static.zerochan.net/Uruha.Rushia.full.3373836.jpg',
      discription: "Можеш ділитись картинками, відео і статтями щодо любимих тайтлів."
  ),
  UnbordingContent(
      title: 'Система рекомендаій',
      image: 'https://static.zerochan.net/Nyarlko.full.1080217.jpg',
      discription: "Не знаєш що подивитись?Тепер це не проблема!"
  ),
  UnbordingContent(
      title: 'Надіюсь що тобі тут сподобається!',
      image: 'https://static.zerochan.net/Nyarlko.full.1099097.jpg',
      discription: "Щоб скористатися усіма можливостями програми рекомендується увійти!"
  ),
];