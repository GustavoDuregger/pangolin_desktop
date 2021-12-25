/*
Copyright 2021 The dahliaOS Authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:pangolin/utils/extensions/extensions.dart';
import 'package:pangolin/widgets/quick_button.dart';

class QsTitlebar extends StatelessWidget implements PreferredSizeWidget {
  const QsTitlebar({Key? key, this.leading, this.title, this.trailing})
      : super(key: key);

  final Widget? leading;
  final String? title;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: Row(
        children: [
          (leading == null && Navigator.canPop(context))
              ? const BackButton()
              : leading!,
          title != null
              ? QuickActionButton(
                  title: title,
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                    color:
                        context.theme.darkMode ? ColorsX.white : ColorsX.black,
                  ),
                )
              : const SizedBox.shrink(),
          const Spacer(),
          ...?trailing,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuickActionButton(
      isCircular: true,
      leading: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
      margin: EdgeInsets.zero,
    );
  }
}
