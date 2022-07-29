part of 'internet_connection_cubit.dart';

abstract class InternetConnectionState {}

class InternetConnectionLoading extends InternetConnectionState {}

class InternetConnectionConnected extends InternetConnectionState {
  final ConnectionType connectionType;

  InternetConnectionConnected({required this.connectionType});
}

class InternetConnectionDisconnect extends InternetConnectionState {}

enum ConnectionType {
  wifi,
  mobile,
}
