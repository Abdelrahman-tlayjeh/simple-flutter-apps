import 'package:flutter/material.dart';
import 'package:useless_app/api/api_handler.dart';
import 'package:useless_app/widgets/post_container.dart';
import 'models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Useless App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data
    fetchData();
  }

  fetchData() async {
    posts = await ApiHandler().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dummy Data App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: Colors.orange,
              ),
              //horizontal spacing
              SizedBox(
                height: 20,
              ),
              Text(
                "Loading Your Dummy Data",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return PostContainr(post: posts![index]);
          },
        ),
      ),
    );
  }
}
