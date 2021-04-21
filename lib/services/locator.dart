import 'package:get_it/get_it.dart';
import 'package:petinder/services/auth.dart';
import 'package:petinder/services/chat_service.dart';
import 'package:petinder/viewmodels/chats_model.dart';
import 'package:petinder/viewmodels/sign_in_model.dart';

GetIt getIt = GetIt.instance;

setupLocators(){
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => AuthService());

  getIt.registerFactory(() => ChatsModel());
  getIt.registerFactory(() => SignInModel());
}