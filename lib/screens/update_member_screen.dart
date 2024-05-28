import 'package:flutter/material.dart';
import '../models/member.dart';

class UpdateMemberScreen extends StatefulWidget {
  final Member member;
  final Function(Member) onUpdateMember;

  UpdateMemberScreen({required this.member, required this.onUpdateMember});

  @override
  _UpdateMemberScreenState createState() => _UpdateMemberScreenState();
}

class _UpdateMemberScreenState extends State<UpdateMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _address;

  @override
  void initState() {
    super.initState();
    _name = widget.member.name;
    _email = widget.member.email;
    _address = widget.member.address;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final updatedMember = Member(
        id: widget.member.id,
        name: _name,
        email: _email,
        address: _address,
      );
      widget.onUpdateMember(updatedMember);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) {
                    _name = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _email,
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) {
                    _email = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _address,
                  decoration: InputDecoration(labelText: 'Address'),
                  onSaved: (value) {
                    _address = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Update Member'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
