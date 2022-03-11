import 'package:flutter/material.dart';

class ExpandedDemoScreen extends StatelessWidget {
  const ExpandedDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                      child: Text(
                          "Mollit anim cillum tempor esse in aliquip id fugiat cupidatat culpa id ea. Ex aute magna eu proident id ea. Nisi aute aliqua laborum aute enim.")),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.add_box_outlined),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Registration")),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
