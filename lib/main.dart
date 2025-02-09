import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _textEditingController = TextEditingController();

  void updateOldTodosWithTimestamp() async {
  final db = FirebaseFirestore.instance;
  final todosSnapshot = await db.collection('todos').get();

  for (final doc in todosSnapshot.docs) {
    if (doc.data().containsKey('createdAt')) continue; // Lewati jika sudah ada

    await db.collection('todos').doc(doc.id).update({
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

  void handleCreateTodo(BuildContext context) async {
    final text = _textEditingController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todo cannot be empty!')),
      );
      return;
    }

    final newTodo = {
      'status': false,
      'text': text,
      'createdAt': FieldValue.serverTimestamp(), // Menambahkan timestamp
    };
    final db = FirebaseFirestore.instance;
    await db.collection('todos').add(newTodo);
    _textEditingController.clear();
  }

  void handleToggleTodo(String id, bool status) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).update({
      'status': !status,
    });
  }

  void handleDeleteTodo(String id) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEEEFF5),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const Text(
                            'List Of Todos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('todos')
                                .orderBy('createdAt', descending: true) // Mengurutkan dari yang terbaru
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              }
                              if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return const Center(
                                  child: Text('No todos available.'),
                                );
                              }

                              return Column(
                                children: [
                                  for (final document in snapshot.data!.docs)
                                    TodoItemWidget(
                                      id: document.id,
                                      name: document.data()['text'],
                                      status: document.data()['status'],
                                      onDelete: (id) {
                                        handleDeleteTodo(id);
                                      },
                                      onToggle: (id, status) {
                                        handleToggleTodo(id, status);
                                      },
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                      ),
                      child: TextButton(
                        onPressed: () {
                          handleCreateTodo(context);
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final bool status;
  final void Function(String) onDelete;
  final void Function(String, bool) onToggle;

  const TodoItemWidget({
    super.key,
    required this.id,
    required this.name,
    required this.status,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToggle(id, status);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          status ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color(0xFF5F52EE),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF3A3A3A),
            decoration: status ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFDA4040),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(id);
            },
          ),
        ),
      ),
    );
  }
}