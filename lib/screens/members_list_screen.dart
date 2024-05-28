import 'package:flutter/material.dart';
import '../models/member.dart';
import 'member_detail_screen.dart';
import 'add_member_screen.dart';
import 'update_member_screen.dart';
import '../widgets/app_drawer.dart';

class MembersListScreen extends StatefulWidget {
  @override
  _MembersListScreenState createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  final List<Member> _members = [
    Member(id: '1', name: 'John Doe', email: 'john.doe@example.com', address: '123 Main St'),
    Member(id: '2', name: 'Jane Smith', email: 'jane.smith@example.com', address: '456 Elm St'),
  ];

  void _addNewMember(Member member) {
    setState(() {
      _members.add(member);
    });
  }

  void _updateMember(Member updatedMember) {
    setState(() {
      int index = _members.indexWhere((member) => member.id == updatedMember.id);
      if (index != -1) {
        _members[index] = updatedMember;
      }
    });
  }

  void _deleteMember(String id) {
    setState(() {
      _members.removeWhere((member) => member.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: _members.length,
        itemBuilder: (context, index) {
          final member = _members[index];
          return ListTile(
            title: Text(member.name),
            subtitle: Text(member.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailScreen(member: member),
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
                        builder: (context) => UpdateMemberScreen(
                          member: member,
                          onUpdateMember: _updateMember,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteMember(member.id);
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
              builder: (context) => AddMemberScreen(onAddMember: _addNewMember),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
