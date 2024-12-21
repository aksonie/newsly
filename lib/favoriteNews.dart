import 'package:flutter/material.dart';
import 'package:drift/native.dart';
import 'package:newsly/database/database.dart';
import 'package:drift/drift.dart' as dr;


class favoriteNews extends StatefulWidget {
  const favoriteNews({super.key});

  @override
  State<favoriteNews> createState() => _favoriteNewsState();
}

class _favoriteNewsState extends State<favoriteNews> {
  final AppDatabase database = AppDatabase(NativeDatabase.memory());

  void _showUpdateDialog(PosteoData news) {
    final TextEditingController titleController = TextEditingController(text: news.title);
    final TextEditingController descriptionController = TextEditingController(text: news.description);
    final TextEditingController authorController = TextEditingController(text: news.author);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update News'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Author'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedNews = PosteoCompanion(
                  title: dr.Value(titleController.text),
                  description: dr.Value(descriptionController.text),
                  author: dr.Value(authorController.text),
                  sourceName: dr.Value(news.sourceName),
                  url: dr.Value(news.url),
                  urlToImage: dr.Value(news.urlToImage),
                  publishedAt: dr.Value(news.publishedAt),
                  content: dr.Value(news.content),
                );
                await database.updateNew(updatedNews);
                setState(() {});
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('News updated')),
                );
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tus noticias favoritas'),
        backgroundColor: Colors.blueGrey[400],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List<PosteoData>>(
          future: database.getAllNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorite news found'));
            } else {
              final newsList = snapshot.data!;
              return Column(
                children: [
                  const Text('Swipe left to delete an item', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final news = newsList[index];
                        return Dismissible(
                          key: Key(news.title ?? 'No title available'),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            await database.deleteNew(news);
                            setState(() {
                              newsList.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('News deleted')),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                              shadowColor: Colors.blueGrey,
                              elevation: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        news.urlToImage != null
                                            ? ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0),
                                          child: Image.network(news.urlToImage),
                                        )
                                            : const Icon(Icons.image_not_supported),
                                        Text(news.author ?? 'No author available'),
                                        Text(news.title ?? 'No title available',
                                          style:
                                          TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                          ),
                                        ),
                                        Text(news.description ?? 'No description available'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          _showUpdateDialog(news);
                                        },
                                        child: Icon(Icons.edit, color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}