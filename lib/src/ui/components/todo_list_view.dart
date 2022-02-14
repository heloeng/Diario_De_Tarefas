// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:teste/controllers/talk_controller.dart';
// import 'package:teste/controllers/user_controller.dart';
// import 'package:teste/src/data/model/to_do_list_model.dart';
// import 'package:teste/src/ui/components/alert_show_todo.dart';
// import 'package:teste/src/ui/components/to_do_list_component.dart';
// import 'package:teste/src/ui/pages/home_page.dart';
// import 'package:teste/src/ui/theme/text_style_widget.dart';
// import 'package:intl/intl.dart';
// class TodoListView extends StatefulWidget {
//   const TodoListView();

//   @override
//   _TodoListViewState createState() => _TodoListViewState();
// }

// class _TodoListViewState extends State<TodoListView> {
//   late final UserController userController = Provider.of<UserController>(
//     context,
//     listen: false,
//   );

//   late final talkController = Provider.of<TalkController>(
//     context,
//     listen: true,
//   );
//   double screenHeight = 0;
//   double screenWidth = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: FirebaseFirestore.instance
//             .collection('tasks')
//             .where('user', isEqualTo: userController.user!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           // if (!snapshot.hasData) {
//           //   return Center(child: CircularProgressIndicator());
//           // }

//           final tasksList = snapshot.data!.docs.map((map) {
//             final data = map.data();
//             return ToDoListModel.fromMap(data, map.id);
//           }).toList();

//           return ToDoListComponent(talkController.tasksList);
        
//         },
//       ),
//     );
//   }
// }
