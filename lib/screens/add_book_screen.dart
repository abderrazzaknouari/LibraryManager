import 'package:flutter/material.dart';
import '../models/book.dart';
import 'dart:math';

class AddBookScreen extends StatefulWidget {
  final Function(Book) onAddBook;

  AddBookScreen({required this.onAddBook});

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  String _description = '';
  String _coverUrl = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newBook = Book(
        id: Random().nextInt(10000).toString(), // Generate a random ID
        title: _title,
        author: _author,
        description: _description,
        coverUrl: _coverUrl,
      );
      widget.onAddBook(newBook);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  onSaved: (value) {
                    _title = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Author'),
                  onSaved: (value) {
                    _author = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an author';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onSaved: (value) {
                    _description = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cover URL'),
                  onSaved: (value) {
                    _coverUrl = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a cover URL';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Add Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
