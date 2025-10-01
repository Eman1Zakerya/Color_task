import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/color_cubit.dart';
import '../cubit/color_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<ColorCubit>().changeColor(),
          child: Scaffold(
            backgroundColor: state.backgroundColor,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.userName == null) ...[
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Enter your name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (nameController.text.isNotEmpty) {
                            context
                                .read<ColorCubit>()
                                .setUserName(nameController.text);
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ] else ...[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        color: state.backgroundColor,
                        child: Text(
                          "Hello ${state.userName}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Tap anywhere to change background color",
                        style: TextStyle(fontSize: 16),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}