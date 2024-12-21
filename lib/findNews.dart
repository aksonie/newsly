import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:newsly/api/New.dart';
import 'package:newsly/api/Service.dart';
import 'package:intl/intl.dart';
import 'package:newsly/database/database.dart';
import 'package:newsly/favoriteNews.dart';
import 'package:newsly/newDetail.dart';
import 'package:drift/drift.dart' as dr;


class findNews extends StatefulWidget {
  const findNews({super.key});

  @override
  State<findNews> createState() => _findNewsState();
}

class _findNewsState extends State<findNews> {
  late Future<List<New>> _futureNews;
  final Service _service = Service(); // Create an instance of Service
  final TextEditingController _keywordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureNews = _service.fetchNews(); // Initialize with all news
  }

  void _searchNews() {
    setState(() {
      if (_keywordController.text.isEmpty) {
        _futureNews = _service.fetchNews(); // Fetch all news if keyword is empty
      } else {
        _futureNews = _service.fetchNewsKeyword(_keywordController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase(NativeDatabase.memory());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca noticias'),
        backgroundColor: Colors.blueGrey[400],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _keywordController,
                    decoration: const InputDecoration(
                      labelText: 'Enter keyword',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchNews,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<New>>(
                future: _futureNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No news found'));
                  } else {
                    final newsList = snapshot.data!;
                    return ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final news = newsList[index];
                        final formattedDate = news.publishedAt != null
                            ? DateFormat('yyyy-MM-dd').format(DateTime.parse(news.publishedAt!))
                            : 'No date available';
                        return Card(
                          shadowColor: Colors.blueGrey,
                          elevation: 3,
                          child: Column(
                            children: [
                              ListTile(
                                leading: news.urlToImage != null
                                    ? Image.network(news.urlToImage!)
                                    : const Icon(Icons.add_a_photo_outlined),
                                subtitle: Text(formattedDate),
                                title: Text(news.title ?? 'No title available'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15, right: 15, bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end ,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blueGrey[300],
                                      ),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => newDetails(news:news)));
                                        },
                                        child: Text('Detalles', style: TextStyle(color: Colors.white)),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.blueGrey[400],
                                      ),
                                      onPressed: () async {
                                        final existingNews = await database.select(database.posteo).get();
                                        final newsExists = existingNews.any((post) => post.title == news.title);

                                        if (newsExists) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('News with the same title already exists'))
                                          );
                                        } else {
                                          final postCompanion = PosteoCompanion(
                                            sourceName: dr.Value(news.sourceName ?? 'Unknown Source'),
                                            author: dr.Value(news.author ?? 'Unknown Author'),
                                            title: dr.Value(news.title ?? 'No title available'),
                                            description: dr.Value(news.description ?? 'No description available'),
                                            url: dr.Value(news.url ?? ''),
                                            urlToImage: dr.Value(news.urlToImage ?? ''),
                                            publishedAt: dr.Value(news.publishedAt ?? ''),
                                            content: dr.Value(news.content ?? ''),
                                          );
                                          await database.into(database.posteo).insert(postCompanion);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Added to favorites'))
                                          );
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>favoriteNews()));
                                        }
                                      },
                                      child: Text('Favoritos', style: TextStyle(color: Colors.white)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}