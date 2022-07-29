import 'package:connectivity_with_bloc/cubit/internet_connection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetConnectionCubit(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Connectivity with BLoC'),
          ),
          body: Center(
            child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
              builder: (context, state) {
                if (state is InternetConnectionConnected && state.connectionType == ConnectionType.wifi) {
                  return Text(
                    'WiFi Connected',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.green),
                  );
                } else if (state is InternetConnectionConnected && state.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Cellular Connected',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.green),
                  );
                } else if (state is InternetConnectionLoading) {
                  return Text(
                    'Finding Network...',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.grey),
                  );
                } else if (state is InternetConnectionDisconnect) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red),
                  );
                }
                return const Text('Something went wrong');
              },
            ),
          ),
        ),
      ),
    );
  }
}
