import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/providers/palindrom_provider.dart';
import 'package:mobile_app/providers/user_provider.dart';
import 'package:mobile_app/view/three_screen.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<PalindromeProvider>(context).name;
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   'Welcome',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child:
                    Text(
                      user?.first_name ?? 'Selected User Name',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                ),
              ),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (_) => ThreeScreen())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Color(0xFF2B637B),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      ),
                      child: Text('Choose a Username',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}