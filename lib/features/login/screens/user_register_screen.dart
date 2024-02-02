import 'package:bhojansathi/bloc/user/register/user_register_bloc.dart';
import 'package:bhojansathi/models/user_model.dart';
import 'package:bhojansathi/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: BlocProvider(
        create: (context) => UserRegisterBloc(userRepository: UserRepository()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserForm(),
        ),
      ),
    );
  }
}

class UserForm extends StatefulWidget {
  UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRegisterBloc, UserRegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Access the input values using the controllers
                String firstName = firstNameController.text;
                String lastName = lastNameController.text;
                String email = emailController.text;

                // Generate a unique userId, you can use a library like `uuid`
                String userId = UniqueKey().toString();

                // Create UserModel from the input
                UserModel user = UserModel(
                  userId: userId,
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                );

                // Dispatch the RegisterUser event to the bloc
                print('Dispatching RegisterUser event with user: $user');
                context.read<UserRegisterBloc>().add(RegisterUser(user));
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
