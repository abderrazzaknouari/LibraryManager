import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_detail_screen.dart';
import 'add_book_screen.dart';
import 'update_book_screen.dart';
import '../widgets/app_drawer.dart';

class BooksListScreen extends StatefulWidget {
  @override
  _BooksListScreenState createState() => _BooksListScreenState();
}

class _BooksListScreenState extends State<BooksListScreen> {
  final List<Book> _books = [
    Book(id: '1', title: 'Flutter for Beginners', author: 'John Doe', description: 'An introduction to Flutter development.', coverUrl: 'assets/book1.jpg'),
    Book(id: '2', title: 'Mastering Flutter', author: 'Jane Smith', description: 'Advanced Flutter development techniques.', coverUrl: 'assets/book2.jpg'),
    Book(id: '3', title: 'Flutter Recipes', author: 'Mary Johnson', description: 'Solutions to common Flutter problems.', coverUrl: 'assets/book3.jpg'),
  ];

  void _addNewBook(Book book) {
    setState(() {
      _books.add(book);
    });
  }

  void _updateBook(Book updatedBook) {
    setState(() {
      int index = _books.indexWhere((book) => book.id == updatedBook.id);
      if (index != -1) {
        _books[index] = updatedBook;
      }
    });
  }

  void _deleteBook(String id) {
    setState(() {
      _books.removeWhere((book) => book.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _books.length,
        itemBuilder: (context, index) {
          final book = _books[index];
          return ListTile(
            leading: Image.asset(book.coverUrl),
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateBookScreen(
                          book: book,
                          onUpdateBook: _updateBook,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteBook(book.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(onAddBook: _addNewBook),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
