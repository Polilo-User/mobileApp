




part of 'repository_list_bloc.dart';

abstract class ResidenceComplexState {}

class ResidenceComplexInitial extends ResidenceComplexState {}

class ResidenceComplexListLoaded extends ResidenceComplexState {
  ResidenceComplexListLoaded({required this.complexList});
  final List<ResidenceComplex> complexList;
}

class ResidenceComplexListLoadFailed extends ResidenceComplexState {}

class ResidenceComplexListEmpty extends ResidenceComplexState {}