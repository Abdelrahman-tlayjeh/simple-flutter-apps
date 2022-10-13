import 'package:flutter/material.dart';
import 'output.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int? gender;
  int height = 170;
  int weight = 80;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //genders row
          Expanded(
            child: Row(
              children: [
                //male card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 0;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            gender == 0 ? Colors.lightGreen : Colors.lightBlue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.male,
                            size: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //female card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 1;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            gender == 1 ? Colors.lightGreen : Colors.lightBlue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.female,
                            size: 100,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //height row
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              height.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              " cm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 250.0,
                          onChanged: (value) {
                            setState(() {
                              height = value.toInt();
                            });
                          },
                          thumbColor: Colors.lightGreen,
                          activeColor: Colors.white,
                          inactiveColor:
                              const Color.fromARGB(255, 86, 183, 228),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //weight and age row
          //weight card
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weight.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              " kg",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (weight == 200) return;
                                  weight++;
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(Icons.add),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (weight == 20) return;
                                  weight--;
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //age card
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              " yr",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (age == 65) return;
                                  age++;
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(Icons.add),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (age == 18) return;
                                  age--;
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //calculate button
          GestureDetector(
            onTap: () {
              if (gender == null) return;

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OutputPage(
                          weight: weight,
                          height: height,
                          age: age,
                          gender: gender ?? 0,
                        )),
              );
            },
            child: Container(
              color: Colors.lightGreen,
              width: double.infinity,
              height: 50,
              child: const Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
