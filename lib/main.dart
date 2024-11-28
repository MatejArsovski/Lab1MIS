import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obleka',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clothes = [
    {
      'name': 'Ralph Lauren T-shirt',
      'image': 'https://www.thesportinglodge.com/cdn/shop/products/Polo-Ralph-Lauren-Custom-Slim-Fit-Cotton-T-Shirt-Ink-1_1320x.jpg?v=1708816895',
      'description': 'Custom Slim Fit Cotton T-Shirt',
      'price': '45 euro'
    },
    {
      'name': 'Diesel Jeans',
      'image': 'https://lv.diesel.com/dw/image/v2/BBLG_PRD/on/demandware.static/-/Sites-diesel-master-catalog/default/dw9c2f2a79/images/large/A11988_008B9_01_F.jpg?q=80',
      'description': 'Darron',
      'price': '120 euro'
    },
    {
      'name': 'Balmain Hoodie',
      'image': 'https://media.balmain.com/image/upload/f_auto,q_auto,dpr_auto/w_auto/sfcc/balmain/hi-res/DH1JR002BB65EABC?_i=AG',
      'description': 'Printed Balmain Hoodie',
      'price': '1200 euro'
    },
    {
      'name': 'Louis Vuitton sneakers',
      'image': 'https://superopulent.co.uk/cdn/shop/products/LVdenimbliue.jpg?v=1654007973&width=1024',
      'description': 'Leather sneakers with logo',
      'price': '1700 euro'
    },
    {'name': 'Nike Shorts',
      'image': 'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/006e79e8-0ae0-4387-8f56-d2a0df68fa41/AS+M+NK+DF+HBR+10IN+SHORT+3.0.png',
      'description': 'Nike shorts with logo',
      'price': '30 euro'
    },

    {
      'name': 'Nike T-shirt',
      'image': 'https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/d15c514d-31a8-4a1a-88df-fb9b92d3170b/M+NK+DF+TEE+2+YR+SWOOSH.png',
      'description': 'Nike T-shirt with logo',
      'price': '35 euro'

    }


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213037'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: clothes.length,
          itemBuilder: (context, index) {
            final item = clothes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      item['image'],
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                item['image'],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              item['name'],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              item['description'],
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ${item['price']}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
