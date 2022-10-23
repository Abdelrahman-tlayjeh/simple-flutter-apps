import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_screen.dart';
import 'package:todo_app/screens/history_screen.dart';
import '../widgets/tasks_list.dart';
import '../widgets/top_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 53, 135),

      //floating add button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddScreen(),
              ),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 211, 80, 4),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),

      //app bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 211, 80, 4),

        //title
        title: const Text(
          "To Do",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 29, 52, 119),
          ),
        ),
        actions: [
          //history button
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen()));
            },
            icon: const Icon(
              Icons.restore_outlined,
              size: 40,
              color: Color.fromARGB(255, 29, 52, 119),
            ),
          ),

          //horizontal spacing
          const SizedBox(
            width: 5,
          ),
        ],
      ),

      //body main container
      body: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 45,
        ),
        child: Column(
          children: const [
            //top bar
            TopBar(),
            //tasks list container
            TasksList(),
          ],
        ),
      ),
    );
  }
}
