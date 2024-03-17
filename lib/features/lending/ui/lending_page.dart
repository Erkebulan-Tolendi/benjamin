import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Benjamin'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Познакомьтесь с нашими работниками',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            _buildWorkerCard(
              name: 'Beglan',
              phoneNumber: '+7 706 745 56 78',
              photoUrl: 'assets/images/worker1.jpg',
            ),
            _buildWorkerCard(
              name: 'Beka Smith',
              phoneNumber: '+7 787 567 34 95',
              photoUrl: 'assets/images/worker2.jpg',
            ),
            // Add more worker cards as needed
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Изучите нашу мебель',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFurnitureCard('assets/images/furniture1.jpg'),
                  _buildFurnitureCard('assets/images/furniture2.jpg'),
                  _buildFurnitureCard('assets/images/furniture3.jpg'),
                  _buildFurnitureCard('assets/images/furniture4.jpg'),
                  _buildFurnitureCard('assets/images/furniture5.jpg'),
                  _buildFurnitureCard('assets/images/furniture6.jpg'),
                  _buildFurnitureCard('assets/images/furniture7.jpg'),
                  // Add more furniture cards as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Отзывы клиентов',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reviews[index]['name']!),
                  subtitle: Text(reviews[index]['comment']!),
                  leading: Icon(Icons.person),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkerCard({
    required String name,
    required String phoneNumber,
    required String photoUrl,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(photoUrl),
        ),
        title: Text(name),
        subtitle: Text(phoneNumber),
      ),
    );
  }

  Widget _buildFurnitureCard(String imageUrl) {
    return Card(
      elevation: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: 150,
        ),
      ),
    );
  }

  final List<Map<String, String>> reviews = [
    {
      'name': 'Александр Петров',
      'comment': 'Очень доволен покупкой, спасибо за отличное обслуживание!'
    },
    {
      'name': 'Мария Иванова',
      'comment': 'Качественная мебель по приятной цене, всем рекомендую!'
    },
    {
      'name': 'Сергей Смирнов',
      'comment': 'Профессиональные сотрудники, всегда готовы помочь с выбором!'
    },
    {
      'name': 'Екатерина Кузнецова',
      'comment': 'Быстрая доставка и отличное качество мебели, спасибо большое!'
    },
    {
      'name': 'Дмитрий Васильев',
      'comment':
          'Приятно удивлен качеством обслуживания, обязательно вернусь снова!'
    },
    // Add more reviews as needed
  ];
}
