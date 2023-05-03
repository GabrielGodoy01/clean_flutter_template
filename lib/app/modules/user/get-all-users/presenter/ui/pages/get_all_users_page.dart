import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../../shared/widgets/footer_widget.dart';
import '../../../../../../../shared/widgets/logo_widget.dart';
import '../../../../../../../shared/widgets/title_pages_widget.dart';
import '../../controllers/get_all_users_controller.dart';
import '../state/get_all_users_state.dart';
import '../widgets/user_widget.dart';

class GetAllUsersPage extends StatelessWidget {
  const GetAllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Modular.get<GetAllUsersController>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
              ? ScreenHelper.width(context)
              : ScreenHelper.breakpointTablet,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                        ? 16
                        : 0),
            child: Column(
              children: [
                const LogoWidget(),
                TitlePagesWidget(text: S.of(context).getAllPageTitle),
                Observer(builder: (_) {
                  if (controller.state is LoadingGetAllState) {
                    return const CircularProgressIndicator();
                  } else if (controller.state is ErrorGetAllState) {
                    return Text(
                        (controller.state as ErrorGetAllState).error.message);
                  } else if (controller.state is SuccessGetAllState) {
                    return SizedBox(
                      height: ScreenHelper.height(context) / 4,
                      child: ListView.builder(
                        itemCount: (controller.state as SuccessGetAllState)
                            .users
                            .length,
                        itemBuilder: (context, index) {
                          var user = (controller.state as SuccessGetAllState)
                              .users[index];
                          return UserWidget(
                            id: user.id ?? '',
                            name: user.name,
                            email: user.email,
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
                const Spacer(),
                const FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
