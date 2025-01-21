import 'dart:convert';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/injector_service.dart';
import '../../../../core/utilities/app_constants.dart';
import '../../model/user_model.dart';
import '../../repos/auth_repository.dart';
import 'auth_states.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(const AuthState(status: AuthStatus.initial));

  Future<void> login(UserModel userModel) async {
      emit(state.copyWith(
        status: AuthStatus.loginLoading,
      ));
      final res = await authRepository.login(userModel);
      res.fold(
            (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
            (res) {
          emit(state.copyWith(
            status: AuthStatus.loginLoaded,
          ));
        },
      );

  }

  Future<void> activeAccount(String phoneNumber,String code) async {
    emit(state.copyWith(
      status: AuthStatus.isActiveAccountLoading,
    ));
    final res = await authRepository.activeAccount(phoneNumber,code);
    res.fold(
          (err) {
        emit(state.copyWith(
          status: AuthStatus.error,
          error: err,
        ));
      },
          (res) {
            cacheService.saveData(
                AppConstants.userToken, res.token);
        emit(state.copyWith(
          isFirstLogin: res.firstLogin,
          status: AuthStatus.isActiveAccountLoaded,
        ));
      },
    );

  }

  Future<void> register(UserModel userModel) async {
      emit(state.copyWith(
        status: AuthStatus.completeRegisterLoading,
      ));
      userModel.gender = isMale ? "male" : "female";
      userModel.cityId = cityId;
      final res = await authRepository.completeRegistration(userModel);
      res.fold(
        (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
        (res) {
          cacheService.saveData(
               AppConstants.userData,jsonEncode(res.toJson()));
          emit(state.copyWith(
            status: AuthStatus.completeRegisterLoaded,
          ));
        },
      );
  }
  bool isMale = true;
  int? cityId;

  selectGender(bool value){
    isMale = value;
    emit(state.copyWith());
  }

  selectCity(int value){
    cityId = value;
    emit(state.copyWith());
  }



  Future<void> logout() async {
      emit(state.copyWith(
        status: AuthStatus.logoutLoading,
      ));
      final res = await authRepository.logout();
      res.fold(
        (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
        (res) {
          cacheService.removeData(AppConstants.userToken);
          cacheService.removeData(AppConstants.userData);
          emit(state.copyWith(
            status: AuthStatus.logoutLoaded,
          ));
        },
      );
  }
  //
  // Future<void> deleteAcc() async {
  //   try {
  //     emit(DeleteAccLoadingState());
  //     final res = await authRepository.deleteAccount();
  //
  //     res.fold(
  //       (err) {
  //         emit(DeleteAccErrorState(err));
  //       },
  //       (res) {
  //         cacheService.removeData(AppConstants.userToken);
  //         cacheService.removeData(AppConstants.userData);
  //         emit(DeleteAccLoadedState());
  //       },
  //     );
  //   } catch (e) {
  //     print(e.toString());
  //     emit(DeleteAccErrorState("error happened".tr()));
  //   }
  // }

  // Future<void> loginViaGoogle() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn(scopes: const ["email"]);
  //   var user = await googleSignIn.signIn();
  //
  //   if (user != null) {
  //     loginWithSocial(
  //         firstName: user.displayName ?? "",
  //         lastName: "",
  //         email: user.email,
  //         phoneNumber: "",
  //         loginType: "GOOGLE",
  //         socialId: user.id,
  //         userPhoto: user.photoUrl ?? "");
  //   }
  // }
  //
  // Future<void> loginViaApple() async {
  //   final credential = await SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //   );
  //
  //   if (credential.userIdentifier != null) {
  //     loginWithSocial(
  //         firstName: credential.givenName ?? "user",
  //         lastName: credential.familyName ?? "",
  //         email: credential.email ?? "",
  //         phoneNumber: "",
  //         loginType: "APPLE",
  //         socialId: credential.userIdentifier ?? "",
  //         userPhoto: "");
  //   }
  // }
}