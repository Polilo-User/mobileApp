




part of 'repository_list_bloc.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsListLoaded extends RoomsState {
  RoomsListLoaded({required this.roomsList});
  final List<Room> roomsList;
}

class RoomsListLoadFailed extends RoomsState {}

class RoomsListEmpty extends RoomsState {}