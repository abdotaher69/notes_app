part of 'notes_cubit.dart';

@immutable
abstract class NotesState {
  const NotesState();
}

final class NotesInitial extends NotesState {}
final class NotesSuccess extends NotesState {}


