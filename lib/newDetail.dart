import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsly/api/New.dart';

class newDetails extends StatelessWidget {
  final New news;

  const newDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {

    final formattedDate = news.publishedAt != null
        ? DateFormat('yyyy-MM-dd').format(DateTime.parse(news.publishedAt!))
        : 'No date available';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la noticia'),
        backgroundColor: Colors.blueGrey[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null && news.urlToImage!.isNotEmpty)
              Image.network(news.urlToImage!),
            SizedBox(height: 8),
            Text(news.title ?? 'No title available',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Author: ${news.author ?? 'Unknown Author'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text('Source: ${news.sourceName ?? 'Unknown Source'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),

            Text('Published At: ${formattedDate}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(news.description ?? 'No description available',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(news.content ?? 'No content available',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}