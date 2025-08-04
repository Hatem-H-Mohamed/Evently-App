// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_remote.dart' as _i368;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/reset_password.dart' as _i1066;
import '../../features/auth/domain/usecases/sign_in_email.dart' as _i1048;
import '../../features/auth/domain/usecases/sign_in_google.dart' as _i770;
import '../../features/auth/domain/usecases/sign_out.dart' as _i568;
import '../../features/auth/domain/usecases/sign_up_email.dart' as _i134;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i368.AuthRemote>(() => _i368.AuthRemoteImplFirebase());
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i984.AuthRepoImpl(authRemote: gh<_i368.AuthRemote>()),
    );
    gh.lazySingleton<_i1066.ResetPassword>(
      () => _i1066.ResetPassword(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i1048.SignInEmail>(
      () => _i1048.SignInEmail(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i770.SignInGoogle>(
      () => _i770.SignInGoogle(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i134.SignUpEmail>(
      () => _i134.SignUpEmail(authRepo: gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i568.SignOut>(() => _i568.SignOut(gh<_i170.AuthRepo>()));
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        gh<_i568.SignOut>(),
        gh<_i1048.SignInEmail>(),
        gh<_i134.SignUpEmail>(),
        gh<_i770.SignInGoogle>(),
        gh<_i1066.ResetPassword>(),
      ),
    );
    return this;
  }
}
