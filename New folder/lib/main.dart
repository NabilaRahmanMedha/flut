import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0), // here the desired height
            child: AppBar(
              title: const Text(
                  'Book List',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white70)
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF41584C),
            )
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Color(0xFFB9A68B),
                Color(0xFF5D7E65),
                //Colors.tealAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:  ListView(
            padding: const EdgeInsets.all(20.0),
            children: const [
              BookCard('The Da Vinci Code: A Novel ', 'Dan Brown', '4.7', 'https://i.ibb.co/qR5XSCz/dvc.jpg','400 Bdt'),
              BookCard('Diary Of a Wimpy Kid', 'Jeff Kinney', '4.4', 'https://i.ibb.co/cTJ30Sp/dwk.jpg', '300 Bdt'),
              BookCard('Harry Potter and the Philosophers Stone', 'J. K. Rowling', '4.6', 'https://i.ibb.co/nw98B2R/2.jpg','450 Bdt'),
              //BookCard('The Ballad of Songbirds and Snakes', 'Suzanne Collins', '3.9', 'https://i.ibb.co/3rDZT2P/download.jpg','500 Bdt'),
              //BookCard('The Hunger Games', 'Suzanne Collins', '4.5', 'https://i.ibb.co/MS2fRvn/download-1.jpg','350 Bdt'),
            ],
          ),
        )
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String urlImage;
  final String price;

  const BookCard(this.bookName, this.authorName, this.rating,this.urlImage, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 8,
        color: Colors.lime.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color(0xFFB9A68B), Colors.transparent, Colors.transparent, Colors.transparent, Color(0xFFB9A68B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),

          child: Column(
              children: [
                ListTile(

                  leading: Image.network(urlImage),
                  title: Text(bookName,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)

                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(authorName),
                      Text('Rating: $rating'),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[800], // Background color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyNowPage(bookName, authorName, rating, urlImage, price),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                  label: const Text('Buy Now', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 6),

              ]
          ),
        )
    );
  }
}
//2nd page
class BuyNowPage extends StatelessWidget {
  final String bookName;
  final String authorName;
  final String rating;
  final String img;
  final String price;

  const BuyNowPage(this.bookName, this.authorName, this.rating, this.img, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9A68B),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: AppBar(
          title: const Text(
              'Buy Now',
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.white70)
          ),
          backgroundColor: const Color(0xFF41584C),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                //scalable
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: Container(
              height: 530,
              width: 300,
              //color: const Color(0xFF5D7E65),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Color(0xFF5D7E65), Color(0xFF5D7E65), Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ Color(0xFF5D7E65), Colors.transparent, Color(0xFF5D7E65)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(bookName,
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Image.network(img),
                      const SizedBox(height: 10),
                      Text('Author: $authorName',
                          style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      const Text('Description: Best selling book of 2023',
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Text('Rating: $rating',
                          style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Price: $price',
                          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[800], // Background color
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Go Back',
                                style: TextStyle(color: Colors.white70)),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[800], // Background color
                            ),
                            onPressed: (){

                            },
                            child: const Text('Add to Cart',
                                style: TextStyle(color: Colors.white70)),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      DropdownButton<String>(
                        items: ['View Cart', 'Saved Items', 'Past Orders']
                            .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                            .toList(),
                        onChanged: (String? value) {
                          // Handle dropdown value change
                        },
                        hint: const Text('Advance Search'),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
