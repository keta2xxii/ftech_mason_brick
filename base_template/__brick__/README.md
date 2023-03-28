# base_source
Template Flutter project for FTech new project.

This project using: 
- Provider for State Management
- Easy Localization for locale language.
- SQLite and Shared Preference for local database.
- Dio and Retrofit for RESTful API controller.
- SocketIO for connect to SocketIO.

## Rules for naming file
- The file name must follow the structure ``folder_name``_``file_name``.``file_type``

## Generate locale_keys
>``fvm flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart``

## Generate .g file
>``fvm flutter pub run build_runner build --delete-conflicting-outputs``

## Switch Build Environment:
>``[flutter command]`` --dart-define=[``defineKey``]=``[prod/dev]``

e.g:
- android:
fvm flutter build appbundle --dart-define=ft_env=prod
fvm flutter build apk --dart-define=ft_env=dev
- iOS:
fvm flutter build ipa --dart-define=ft_env=dev
fvm flutter build ipa --dart-define=ft_env=prod

## Scripts Build For android
>Run this command ``` sh scripts/generate_apk.sh [build_number]```

>Result Apk will be named follow : ``Prod/Staging-[build_number]``.apk

## Script for first clone project
> Run this command ```sh scripts/setup_project.sh [flutter_version]```


