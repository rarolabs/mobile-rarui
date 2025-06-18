import 'package:flutter/material.dart';

import '../../../../../utils/interfaces/behaviour.dart';
import '../../../../../utils/interfaces/style.dart';
import '../../../../../utils/mixin/component.dart';
import '../../../../theme/sizes.dart';
import '../../../../theme/theme_data.dart';
import '../../../../utils/enums/coin_type.dart';
import '../../../../utils/extensions/num_extension.dart';
import '../../../atoms/icon/icon.dart';
import '../../../atoms/label/label.dart';
import '../app_bar/app_bar_specs.dart';
import '../app_bar_style.dart';

class AccountBalanceAppBarComponent extends StatelessWidget
    with Component<QAppBarStyle, QAppBarSharedStyle>
    implements PreferredSizeWidget {
  /// Comportamento do componente, initial [Behaviour.regular].
  final Behaviour behaviour;

  /// Caminho para o asset do logo do banco.
  final ImageProvider logo;

  /// Nome de usuário da conta.
  final String userName;

  /// Texto que aparece no botão
  final String textButton;

  /// Tipo de moeda trabalhada.
  final CoinType coinType;

  /// saldo da conta.
  final double accountBalance;

  /// Estilo do componente.
  final AppBarStyleSet styles;

  /// Ações para appbar.
  final List<Widget>? actions;

  /// True para esconder o saldo da conta.
  final bool accountBalanceIsHidden;

  /// Texto de acessibilidade.
  final String? buttonSemantics;

  /// Ação de acessibilidade ao interagir com o componente.
  final String? hintSemantics;

  /// Callback com ação para adicionar saldo a conta.
  final VoidCallback buttonAccountBalanceCallback;

  /// Callback com ação para alterar a visibilidade do saldo da conta.
  final void Function(bool)? onChangeAccountBalanceVisibility;

  /// Responsável por exibir o widget de Adicionar Saldo
  final bool addBalanceVisible;

  const AccountBalanceAppBarComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    this.actions,
    this.buttonSemantics,
    this.hintSemantics,
    required this.logo,
    required this.userName,
    required this.coinType,
    required this.accountBalance,
    required this.accountBalanceIsHidden,
    required this.textButton,
    required this.buttonAccountBalanceCallback,
    this.onChangeAccountBalanceVisibility,
    required this.addBalanceVisible,
  });

  @override
  Widget build(BuildContext context) {
    final style = Style<QAppBarStyle, QAppBarSharedStyle>(
      shared: styles.specs.shared,
      regular: styles.specs.regular,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenRegular(
    QAppBarStyle style,
    QAppBarSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) {
    return _AccountBalanceAppBar(
      behaviour: behaviour,
      style: style,
      logo: logo,
      userName: userName,
      coinType: coinType,
      accountBalance: accountBalance,
      actions: actions,
      accountBalanceIsHidden: accountBalanceIsHidden,
      textButton: textButton,
      buttonAccountBalanceCallback: buttonAccountBalanceCallback,
      buttonSemantics: buttonSemantics,
      hintSemantics: hintSemantics,
      onChangeAccountBalanceVisibility: onChangeAccountBalanceVisibility,
      addBalanceVisible: addBalanceVisible,
    );
  }

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.disabled: Behaviour.regular,
        Behaviour.loading: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };

  @override
  Size get preferredSize => const Size.fromHeight(QSizes.x248);
}

class _AccountBalanceAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Behaviour behaviour;
  final QAppBarStyle style;
  final ImageProvider logo;
  final String userName;
  final CoinType coinType;
  final double accountBalance;
  final List<Widget>? actions;
  final bool accountBalanceIsHidden;
  final String textButton;
  final VoidCallback buttonAccountBalanceCallback;
  final String? buttonSemantics;
  final String? hintSemantics;
  final void Function(bool)? onChangeAccountBalanceVisibility;
  final bool addBalanceVisible;

  const _AccountBalanceAppBar({
    required this.behaviour,
    required this.style,
    required this.logo,
    required this.userName,
    required this.coinType,
    required this.accountBalance,
    this.actions,
    required this.accountBalanceIsHidden,
    required this.textButton,
    required this.buttonAccountBalanceCallback,
    this.buttonSemantics,
    this.hintSemantics,
    this.onChangeAccountBalanceVisibility,
    required this.addBalanceVisible,
  });

  @override
  State<_AccountBalanceAppBar> createState() => _AccountBalanceAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(QSizes.x248);
}

class _AccountBalanceAppBarState extends State<_AccountBalanceAppBar> {
  late final ValueNotifier<bool> _accountBalanceIsHidden;

  @override
  void initState() {
    super.initState();
    _accountBalanceIsHidden = ValueNotifier<bool>(widget.accountBalanceIsHidden);
  }

  @override
  void didUpdateWidget(_AccountBalanceAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.accountBalanceIsHidden != widget.accountBalanceIsHidden) {
      _accountBalanceIsHidden.value = widget.accountBalanceIsHidden;
    }
  }

  @override
  void dispose() {
    _accountBalanceIsHidden.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBehaviour = widget.behaviour.isLoading ? Behaviour.disabled : widget.behaviour;

    return Semantics(
      label: widget.buttonSemantics,
      hint: widget.hintSemantics,
      child: Container(
        decoration: BoxDecoration(color: QTheme.colors.primaryColorBase),
        padding: const EdgeInsets.all(QSizes.x16),
        child: Column(
          spacing: QSizes.x32,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: QSizes.x156,
                  height: QSizes.x56,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (widget.actions?.isNotEmpty ?? false) ...widget.actions!,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: QSizes.x20,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  height: QSizes.x76,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.style.usernameTextStyle != null)
                        Flexible(
                          child: SizedBox(
                            height: QSizes.x32,
                            child: QLabel(
                              style: widget.style.usernameTextStyle!,
                              behaviour: widget.behaviour,
                              text: widget.userName,
                            ),
                          ),
                        ),
                      Flexible(
                        child: _AnimatedSaldo(
                          accountBalanceIsHidden: _accountBalanceIsHidden,
                          style: widget.style,
                          behaviour: statusBehaviour,
                          accountBalance: widget.accountBalance,
                          coinType: widget.coinType,
                          onChangeAccountBalanceVisibility: widget.onChangeAccountBalanceVisibility,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  highlightColor: QTheme.colors.white,
                  splashColor: QTheme.colors.white,
                  onTap: widget.buttonAccountBalanceCallback,
                  child: Row(
                    spacing: QSizes.x4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.style.iconAddTextStyle != null && widget.addBalanceVisible)
                        QIcon(
                          key: const Key('icon_add_balance'),
                          style: widget.style.iconAddTextStyle!,
                          behaviour: statusBehaviour,
                          svgPath: QTheme.svgs.add,
                        ),
                      if (widget.style.textSaldoTextStyle != null && widget.addBalanceVisible)
                        QLabel(
                          style: widget.style.textSaldoTextStyle!,
                          behaviour: statusBehaviour,
                          text: widget.textButton,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSaldo extends StatefulWidget {
  final ValueNotifier<bool> accountBalanceIsHidden;
  final QAppBarStyle style;
  final Behaviour behaviour;
  final double accountBalance;
  final CoinType coinType;
  final Function(bool)? onChangeAccountBalanceVisibility;

  const _AnimatedSaldo({
    required this.accountBalanceIsHidden,
    required this.style,
    required this.behaviour,
    required this.accountBalance,
    required this.coinType,
    required this.onChangeAccountBalanceVisibility,
  });

  @override
  State<_AnimatedSaldo> createState() => _AnimatedSaldoState();
}

class _AnimatedSaldoState extends State<_AnimatedSaldo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool alreadyAnimated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 0, end: widget.accountBalance).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    widget.accountBalanceIsHidden.addListener(showHideListenerAnimation);
  }

  void showHideListenerAnimation() {
    if (!widget.accountBalanceIsHidden.value && !alreadyAnimated) {
      alreadyAnimated = true;
      _startAnimation();
    }
  }

  @override
  void didUpdateWidget(_AnimatedSaldo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.accountBalance != widget.accountBalance) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    _controller.reset();
    _animation = Tween<double>(begin: 0, end: widget.accountBalance).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animation.removeListener(showHideListenerAnimation);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.accountBalanceIsHidden,
      builder: (_, accountBalanceIsHidden, __) {
        return Row(
          spacing: QSizes.x8,
          children: [
            if (accountBalanceIsHidden)
              QLabel(
                style: widget.style.obscureTextStyle!,
                behaviour: widget.behaviour,
                text: '${widget.coinType.symbol} ••••••',
              )
            else
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return QLabel(
                    style: widget.style.obscureTextStyle!,
                    behaviour: widget.behaviour,
                    text: _animation.value.formattedMoney(widget.coinType),
                    maxLines: 1,
                  );
                },
              ),
            if (widget.style.iconTextStyle != null)
              Padding(
                padding: EdgeInsets.only(top: accountBalanceIsHidden ? QSizes.x4 : QSizes.x8),
                child: QIcon(
                  key: const Key('icon_eye'),
                  style: widget.style.iconTextStyle!,
                  behaviour: widget.behaviour,
                  svgPath: accountBalanceIsHidden ? QTheme.svgs.visibility : QTheme.svgs.visibilityHide,
                  onPressed: () {
                    widget.accountBalanceIsHidden.value = !accountBalanceIsHidden;
                    widget.onChangeAccountBalanceVisibility?.call(accountBalanceIsHidden);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
