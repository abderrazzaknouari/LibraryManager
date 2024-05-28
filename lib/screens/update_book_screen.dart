import 'package:flutter/material.dart';
import '../models/book.dart';

class UpdateBookScreen extends StatefulWidget {
  final Book book;
  final Function(Book) onUpdateBook;

  UpdateBookScreen({required this.book, required this.onUpdateBook});

  @override
  _UpdateBookScreenState createState() => _UpdateBookScreenState();
}

class _UpdateBookScreenState extends State<UpdateBookScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _author;
  late String _description;
  late String _coverUrl;

  @override
  void initState() {
    super.initState();
    _title = widget.book.title;
    _author = widget.book.author;
    _description = widget.book.description;
    _coverUrl = widget.book.coverUrl;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final updatedBook = Book(
        id: widget.book.id,
        title: _title,
        author: _author,
        description: _description,
        coverUrl: _coverUrl,
      );
      widget.onUpdateBook(updatedBook);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Book'),
      ),
      body: Padding(
            padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _title,
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
                  initialValue: _author,
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
                  initialValue: _description,
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
                  initialValue: _coverUrl,
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
                  child: Text('Update Book'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

