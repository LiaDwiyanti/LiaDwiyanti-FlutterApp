import 'package:flutter/material.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:mobile_app/services/user_service.dart';
import 'package:mobile_app/view/second_screen.dart';
import 'package:mobile_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Three Screen',
          style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: FutureBuilder(
        future: getUser().catchError((value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(value.toString()),
              backgroundColor: const Color.fromARGB(255, 192, 13, 0),
            ),
          );
          return <User>[];
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final user = snapshot.data!;
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) => ListTile(
                minVerticalPadding: 16,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    user[index].avatar,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  
                  ),
                ),
                title: Row(
                  children: [
                    Text(user[index].first_name, 
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(user[index].last_name, 
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(user[index].email,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () {
                  Provider.of<UserProvider>(context, listen: false).setUser(user[index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(), 
                      ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        }),
    );
  }
}