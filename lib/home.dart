import 'package:flutter/material.dart';
import 'package:newsly/favoriteNews.dart';
import 'package:newsly/findNews.dart';
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newsly'),
        backgroundColor: Colors.blueGrey[400],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido a Newsly',style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[600]
            ),),
            SizedBox(height: 15),
            Image(image: AssetImage('assets/img/newsly_logo.png')),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey[300]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>findNews()));
                  },
                  child: Text('Busca noticias'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey[300]
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>favoriteNews()));
                  },
                  child: Text('Tus noticias favoritas'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
