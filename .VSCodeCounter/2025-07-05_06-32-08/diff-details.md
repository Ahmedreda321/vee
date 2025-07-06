# Diff Details

Date : 2025-07-05 06:32:08

Directory /media/username/harddrive/Projects/vee

Total : 103 files,  3213 codes, 28 comments, 417 blanks, all 3658 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [android/Gemfile](/android/Gemfile) | Ruby | 5 | 0 | 3 | 8 |
| [android/app/google-services.json](/android/app/google-services.json) | JSON | 67 | 0 | 0 | 67 |
| [android/app/src/main/AndroidManifest.xml](/android/app/src/main/AndroidManifest.xml) | XML | 2 | 0 | 0 | 2 |
| [android/fastlane/Appfile](/android/fastlane/Appfile) | Ruby | 2 | 0 | 1 | 3 |
| [android/fastlane/README.md](/android/fastlane/README.md) | Markdown | 19 | 0 | 14 | 33 |
| [android/fastlane/report.xml](/android/fastlane/report.xml) | XML | 15 | 0 | 19 | 34 |
| [firebase.json](/firebase.json) | JSON | 1 | 0 | 0 | 1 |
| [lib/core/constants/app\_constants.dart](/lib/core/constants/app_constants.dart) | Dart | 1 | 0 | 1 | 2 |
| [lib/core/constants/strings\_constants.dart](/lib/core/constants/strings_constants.dart) | Dart | -36 | -1 | -7 | -44 |
| [lib/core/errors/failures.dart](/lib/core/errors/failures.dart) | Dart | 7 | 0 | 1 | 8 |
| [lib/core/models/base\_data\_source.dart](/lib/core/models/base_data_source.dart) | Dart | 13 | 0 | 3 | 16 |
| [lib/core/network/api\_service.dart](/lib/core/network/api_service.dart) | Dart | 39 | 12 | 12 | 63 |
| [lib/core/network/api\_service.g.dart](/lib/core/network/api_service.g.dart) | Dart | -105 | -6 | -16 | -127 |
| [lib/core/network/endpoint\_constants.dart](/lib/core/network/endpoint_constants.dart) | Dart | 9 | 0 | 0 | 9 |
| [lib/core/routing/app\_router.dart](/lib/core/routing/app_router.dart) | Dart | 26 | 0 | 0 | 26 |
| [lib/core/routing/routes.dart](/lib/core/routing/routes.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/core/services/locale\_service.dart](/lib/core/services/locale_service.dart) | Dart | -19 | -2 | -17 | -38 |
| [lib/core/services/map\_services/location\_tracker.dart](/lib/core/services/map_services/location_tracker.dart) | Dart | 196 | 28 | 38 | 262 |
| [lib/core/services/map\_services/map\_screen.dart](/lib/core/services/map_services/map_screen.dart) | Dart | 336 | 31 | 47 | 414 |
| [lib/core/services/map\_services/maps\_services.dart](/lib/core/services/map_services/maps_services.dart) | Dart | 177 | 14 | 29 | 220 |
| [lib/core/services/maps\_services.dart](/lib/core/services/maps_services.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/core/usecases/base\_use\_case.dart](/lib/core/usecases/base_use_case.dart) | Dart | 1 | 1 | 1 | 3 |
| [lib/core/utils/app\_functions.dart](/lib/core/utils/app_functions.dart) | Dart | 2 | 0 | -1 | 1 |
| [lib/core/utils/app\_shared\_pref\_consts.dart](/lib/core/utils/app_shared_pref_consts.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/core/utils/app\_shared\_preferences.dart](/lib/core/utils/app_shared_preferences.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/core/utils/app\_size.dart](/lib/core/utils/app_size.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/features/driver/home/data/datasources/driver\_home\_local\_data\_source.dart](/lib/features/driver/home/data/datasources/driver_home_local_data_source.dart) | Dart | 0 | 17 | 6 | 23 |
| [lib/features/driver/home/data/datasources/driver\_home\_remot\_data\_source.dart](/lib/features/driver/home/data/datasources/driver_home_remot_data_source.dart) | Dart | 21 | 0 | 6 | 27 |
| [lib/features/driver/home/data/mapper/driver\_home\_mapper.dart](/lib/features/driver/home/data/mapper/driver_home_mapper.dart) | Dart | 99 | 1 | 7 | 107 |
| [lib/features/driver/home/data/models/driver\_home\_response.dart](/lib/features/driver/home/data/models/driver_home_response.dart) | Dart | 16 | 0 | 5 | 21 |
| [lib/features/driver/home/data/models/fault\_report\_model.dart](/lib/features/driver/home/data/models/fault_report_model.dart) | Dart | 24 | 0 | 6 | 30 |
| [lib/features/driver/home/data/models/lcation\_update\_model.dart](/lib/features/driver/home/data/models/lcation_update_model.dart) | Dart | 30 | 0 | 6 | 36 |
| [lib/features/driver/home/data/models/trip\_model.dart](/lib/features/driver/home/data/models/trip_model.dart) | Dart | 101 | 0 | 15 | 116 |
| [lib/features/driver/home/data/models/trip\_report\_model.dart](/lib/features/driver/home/data/models/trip_report_model.dart) | Dart | 16 | 0 | 5 | 21 |
| [lib/features/driver/home/data/repositories/driver\_home\_repository\_impl.dart](/lib/features/driver/home/data/repositories/driver_home_repository_impl.dart) | Dart | 114 | 0 | 9 | 123 |
| [lib/features/driver/home/di/driver\_home\_di.dart](/lib/features/driver/home/di/driver_home_di.dart) | Dart | 30 | 6 | 10 | 46 |
| [lib/features/driver/home/domain/entities/driver\_home\_entities.dart](/lib/features/driver/home/domain/entities/driver_home_entities.dart) | Dart | 90 | 0 | 14 | 104 |
| [lib/features/driver/home/domain/repositories/driver\_home\_repository.dart](/lib/features/driver/home/domain/repositories/driver_home_repository.dart) | Dart | 12 | 0 | 2 | 14 |
| [lib/features/driver/home/domain/usecases/fault\_report\_use\_case.dart](/lib/features/driver/home/domain/usecases/fault_report_use_case.dart) | Dart | 13 | 0 | 5 | 18 |
| [lib/features/driver/home/domain/usecases/get\_trips\_ues\_case.dart](/lib/features/driver/home/domain/usecases/get_trips_ues_case.dart) | Dart | 13 | 0 | 3 | 16 |
| [lib/features/driver/home/domain/usecases/report\_trip\_use\_case.dart](/lib/features/driver/home/domain/usecases/report_trip_use_case.dart) | Dart | 13 | 0 | 6 | 19 |
| [lib/features/driver/home/domain/usecases/start\_trip\_use\_case.dart](/lib/features/driver/home/domain/usecases/start_trip_use_case.dart) | Dart | 12 | 0 | 5 | 17 |
| [lib/features/driver/home/presentation/cubit/home\_cubit.dart](/lib/features/driver/home/presentation/cubit/home_cubit.dart) | Dart | -6 | 0 | -3 | -9 |
| [lib/features/driver/home/presentation/cubit/home\_state.dart](/lib/features/driver/home/presentation/cubit/home_state.dart) | Dart | -7 | 0 | -4 | -11 |
| [lib/features/driver/home/presentation/cubits/cubit/map\_screen\_cubit.dart](/lib/features/driver/home/presentation/cubits/cubit/map_screen_cubit.dart) | Dart | 62 | 1 | 9 | 72 |
| [lib/features/driver/home/presentation/cubits/cubit/map\_screen\_state.dart](/lib/features/driver/home/presentation/cubits/cubit/map_screen_state.dart) | Dart | 12 | 0 | 3 | 15 |
| [lib/features/driver/home/presentation/cubits/driver\_home\_cubit/driver\_home\_cubit.dart](/lib/features/driver/home/presentation/cubits/driver_home_cubit/driver_home_cubit.dart) | Dart | 71 | 41 | 25 | 137 |
| [lib/features/driver/home/presentation/cubits/driver\_home\_cubit/driver\_home\_state.dart](/lib/features/driver/home/presentation/cubits/driver_home_cubit/driver_home_state.dart) | Dart | 14 | 0 | 4 | 18 |
| [lib/features/driver/home/presentation/screens/driver\_home\_screen.dart](/lib/features/driver/home/presentation/screens/driver_home_screen.dart) | Dart | 4 | -69 | -6 | -71 |
| [lib/features/driver/home/presentation/screens/map\_view.dart](/lib/features/driver/home/presentation/screens/map_view.dart) | Dart | 425 | 6 | 25 | 456 |
| [lib/features/driver/home/presentation/widgets/app\_error\_dialog.dart](/lib/features/driver/home/presentation/widgets/app_error_dialog.dart) | Dart | 23 | 0 | 3 | 26 |
| [lib/features/driver/home/presentation/widgets/driver\_home\_list\_view.dart](/lib/features/driver/home/presentation/widgets/driver_home_list_view.dart) | Dart | 18 | 0 | 3 | 21 |
| [lib/features/driver/home/presentation/widgets/driver\_home\_listview.dart](/lib/features/driver/home/presentation/widgets/driver_home_listview.dart) | Dart | 63 | 0 | 8 | 71 |
| [lib/features/driver/home/presentation/widgets/driver\_home\_loaded.dart](/lib/features/driver/home/presentation/widgets/driver_home_loaded.dart) | Dart | 45 | 1 | 5 | 51 |
| [lib/features/driver/home/presentation/widgets/driver\_trip\_card.dart](/lib/features/driver/home/presentation/widgets/driver_trip_card.dart) | Dart | 40 | 0 | 3 | 43 |
| [lib/features/driver/home/presentation/widgets/home\_list\_view.dart](/lib/features/driver/home/presentation/widgets/home_list_view.dart) | Dart | -18 | 0 | -3 | -21 |
| [lib/features/driver/home/presentation/widgets/home\_trip\_card.dart](/lib/features/driver/home/presentation/widgets/home_trip_card.dart) | Dart | -33 | 0 | -3 | -36 |
| [lib/features/driver/home/presentation/widgets/start\_button.dart](/lib/features/driver/home/presentation/widgets/start_button.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/features/driver/home/presentation/widgets/trip\_loding.dart](/lib/features/driver/home/presentation/widgets/trip_loding.dart) | Dart | 54 | 3 | 5 | 62 |
| [lib/features/mechanic/home/data/datasources/mechanic\_home\_remot\_data\_source.dart](/lib/features/mechanic/home/data/datasources/mechanic_home_remot_data_source.dart) | Dart | 22 | 0 | 2 | 24 |
| [lib/features/mechanic/home/data/mapper/mechanic\_home\_mapper.dart](/lib/features/mechanic/home/data/mapper/mechanic_home_mapper.dart) | Dart | 61 | 1 | 10 | 72 |
| [lib/features/mechanic/home/data/models/finish\_repair\_model.dart](/lib/features/mechanic/home/data/models/finish_repair_model.dart) | Dart | 20 | 0 | 5 | 25 |
| [lib/features/mechanic/home/data/models/maintenance\_respons.dart](/lib/features/mechanic/home/data/models/maintenance_respons.dart) | Dart | 91 | 0 | 13 | 104 |
| [lib/features/mechanic/home/data/models/mechanic\_home\_response.dart](/lib/features/mechanic/home/data/models/mechanic_home_response.dart) | Dart | 12 | 1 | 5 | 18 |
| [lib/features/mechanic/home/data/models/part\_model.dart](/lib/features/mechanic/home/data/models/part_model.dart) | Dart | 20 | 0 | 4 | 24 |
| [lib/features/mechanic/home/data/models/start\_repair\_model.dart](/lib/features/mechanic/home/data/models/start_repair_model.dart) | Dart | 27 | 0 | 10 | 37 |
| [lib/features/mechanic/home/data/repositories/mechanic\_home\_repository\_impl.dart](/lib/features/mechanic/home/data/repositories/mechanic_home_repository_impl.dart) | Dart | 109 | 0 | 10 | 119 |
| [lib/features/mechanic/home/di/mechanic\_di.dart](/lib/features/mechanic/home/di/mechanic_di.dart) | Dart | 35 | 6 | 7 | 48 |
| [lib/features/mechanic/home/domain/entities/maintenance\_entitied.dart](/lib/features/mechanic/home/domain/entities/maintenance_entitied.dart) | Dart | 45 | 1 | 11 | 57 |
| [lib/features/mechanic/home/domain/repositories/mechanic\_home\_repository.dart](/lib/features/mechanic/home/domain/repositories/mechanic_home_repository.dart) | Dart | 13 | 0 | 1 | 14 |
| [lib/features/mechanic/home/domain/usecases/finish\_repair\_use\_case.dart](/lib/features/mechanic/home/domain/usecases/finish_repair_use_case.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/features/mechanic/home/domain/usecases/get\_maintenance\_use\_case.dart](/lib/features/mechanic/home/domain/usecases/get_maintenance_use_case.dart) | Dart | 16 | 1 | 5 | 22 |
| [lib/features/mechanic/home/domain/usecases/get\_parts\_use\_case.dart](/lib/features/mechanic/home/domain/usecases/get_parts_use_case.dart) | Dart | 13 | 0 | 4 | 17 |
| [lib/features/mechanic/home/domain/usecases/start\_repair\_use\_case.dart](/lib/features/mechanic/home/domain/usecases/start_repair_use_case.dart) | Dart | 14 | 0 | 6 | 20 |
| [lib/features/mechanic/home/presentation/cubit/mechanic\_home\_cubit.dart](/lib/features/mechanic/home/presentation/cubit/mechanic_home_cubit.dart) | Dart | 65 | 1 | 9 | 75 |
| [lib/features/mechanic/home/presentation/cubit/mechanic\_home\_state.dart](/lib/features/mechanic/home/presentation/cubit/mechanic_home_state.dart) | Dart | 25 | 3 | 6 | 34 |
| [lib/features/mechanic/home/presentation/screens/mechanic\_home\_screen.dart](/lib/features/mechanic/home/presentation/screens/mechanic_home_screen.dart) | Dart | 24 | 4 | 5 | 33 |
| [lib/features/mechanic/home/presentation/widgets/finish\_repair\_bottom\_sheet.dart](/lib/features/mechanic/home/presentation/widgets/finish_repair_bottom_sheet.dart) | Dart | 570 | 2 | 55 | 627 |
| [lib/features/mechanic/home/presentation/widgets/mechanic\_home\_card.dart](/lib/features/mechanic/home/presentation/widgets/mechanic_home_card.dart) | Dart | 69 | 1 | 5 | 75 |
| [lib/features/mechanic/home/presentation/widgets/mechanic\_home\_listview.dart](/lib/features/mechanic/home/presentation/widgets/mechanic_home_listview.dart) | Dart | 103 | 3 | 9 | 115 |
| [lib/features/mechanic/home/presentation/widgets/mechanic\_home\_loded.dart](/lib/features/mechanic/home/presentation/widgets/mechanic_home_loded.dart) | Dart | 25 | 0 | 3 | 28 |
| [lib/features/mechanic/home/presentation/widgets/mechanic\_start\_button.dart](/lib/features/mechanic/home/presentation/widgets/mechanic_start_button.dart) | Dart | 34 | 0 | 6 | 40 |
| [lib/features/mechanic/home/presentation/widgets/start\_repair\_bottom\_sheet.dart](/lib/features/mechanic/home/presentation/widgets/start_repair_bottom_sheet.dart) | Dart | 618 | 2 | 60 | 680 |
| [lib/features/mechanic/notificatinos/presentation/cubit/notificatinos\_cubit.dart](/lib/features/mechanic/notificatinos/presentation/cubit/notificatinos_cubit.dart) | Dart | 6 | 0 | 3 | 9 |
| [lib/features/mechanic/notificatinos/presentation/cubit/notificatinos\_state.dart](/lib/features/mechanic/notificatinos/presentation/cubit/notificatinos_state.dart) | Dart | 7 | 0 | 4 | 11 |
| [lib/features/shared/auth/data/models/business\_user\_dto.g.dart](/lib/features/shared/auth/data/models/business_user_dto.g.dart) | Dart | -15 | -4 | -5 | -24 |
| [lib/features/shared/auth/data/models/forogt\_password\_request\_body.g.dart](/lib/features/shared/auth/data/models/forogt_password_request_body.g.dart) | Dart | -6 | -4 | -6 | -16 |
| [lib/features/shared/auth/data/models/login\_request\_body.dart](/lib/features/shared/auth/data/models/login_request_body.dart) | Dart | 0 | 0 | 2 | 2 |
| [lib/features/shared/auth/data/models/login\_request\_body.g.dart](/lib/features/shared/auth/data/models/login_request_body.g.dart) | Dart | -6 | -4 | -6 | -16 |
| [lib/features/shared/auth/data/models/login\_response.dart](/lib/features/shared/auth/data/models/login_response.dart) | Dart | 5 | 0 | 1 | 6 |
| [lib/features/shared/auth/data/models/login\_response.g.dart](/lib/features/shared/auth/data/models/login_response.g.dart) | Dart | -22 | -4 | -5 | -31 |
| [lib/features/shared/auth/di/auth\_di.dart](/lib/features/shared/auth/di/auth_di.dart) | Dart | -8 | 6 | 4 | 2 |
| [lib/features/shared/auth/presentation/cubits/forgot\_passwprd\_cubit/forgot\_password\_state.freezed.dart](/lib/features/shared/auth/presentation/cubits/forgot_passwprd_cubit/forgot_password_state.freezed.dart) | Dart | -511 | -42 | -78 | -631 |
| [lib/features/shared/auth/presentation/cubits/login\_cubit/login\_cubit.dart](/lib/features/shared/auth/presentation/cubits/login_cubit/login_cubit.dart) | Dart | -2 | 0 | 1 | -1 |
| [lib/features/shared/auth/presentation/cubits/login\_cubit/login\_state.freezed.dart](/lib/features/shared/auth/presentation/cubits/login_cubit/login_state.freezed.dart) | Dart | -511 | -42 | -78 | -631 |
| [lib/features/shared/auth/presentation/screens/reset\_password\_screen.dart](/lib/features/shared/auth/presentation/screens/reset_password_screen.dart) | Dart | 0 | 0 | -1 | -1 |
| [lib/features/shared/auth/presentation/widgets/login\_bloc\_listener.dart](/lib/features/shared/auth/presentation/widgets/login_bloc_listener.dart) | Dart | 2 | 0 | 1 | 3 |
| [lib/features/shared/onboarding/presentation/widgets/on\_boarding\_welcome.dart](/lib/features/shared/onboarding/presentation/widgets/on_boarding_welcome.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/firebase\_options.dart](/lib/firebase_options.dart) | Dart | 53 | 12 | 4 | 69 |
| [lib/main.dart](/lib/main.dart) | Dart | -20 | 0 | -8 | -28 |
| [lib/main\_dev.dart](/lib/main_dev.dart) | Dart | 26 | 0 | 9 | 35 |
| [lib/main\_proud.dart](/lib/main_proud.dart) | Dart | 24 | 0 | 9 | 33 |
| [pubspec.yaml](/pubspec.yaml) | YAML | 4 | 0 | 0 | 4 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details