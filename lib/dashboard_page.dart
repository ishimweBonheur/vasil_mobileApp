import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isSwitch = false;
  bool isCheckbox= false;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image with proper error handling
              Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/image.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Image not found')),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, thickness: 1),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.blueAccent,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    'Welcome to the Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  debugPrint('elevated button');
                },
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: isSwitch ? Colors.green : Colors.blue,
                  shape:
                      const RoundedRectangleBorder(), // No borderRadius property
                ),
                child: const Text('click me'),
              ),
                OutlinedButton(
                onPressed: () {
                  debugPrint('outlined button');
                },
                style: ElevatedButton.styleFrom(
                  shape:
                      const RoundedRectangleBorder(), // No borderRadius property
                ),
                child: const Text('click me'),
              ),
                      Switch(value: isSwitch, onChanged: (bool newBool){
                        setState(() {
                         isSwitch=newBool; 
                        });
                        }, ),
          
                        Checkbox(value: isCheckbox, onChanged: (bool? newBool){
                          setState(() {
                            isCheckbox=newBool ?? false;
                          });
                        }),
          
            ],
          ),
        ),

      ),
    );
  }
}
