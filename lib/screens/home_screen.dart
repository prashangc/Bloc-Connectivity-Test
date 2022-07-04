import 'package:app/blocs/internet_bloc/internet_bloc.dart';
import 'package:app/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Pattern- Connectivity test"),
        ),
        body: SafeArea(
          child: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Internet Connected!'),
                    backgroundColor: Colors.green,
                  ));
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Internet Disconnected!'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                // if (state == ) is used to check value
                // if (state is ) is used to check datatype
                if (state is InternetGainedState) {
                  return const Text("connected");
                } else if (state is InternetLostState) {
                  return const Text("not connected");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
