# 🧩 RaroUI — Design System Flutter da RaroLabs

> Sistema de design unificado e reutilizável para aplicativos Flutter da RaroLabs.

## 🚀 Visão Geral

O **RaroUI** fornece um conjunto de componentes visuais e temas centralizados que garantem consistência e eficiência no desenvolvimento de produtos mobile.

- 📦 Componentes reutilizáveis
- 🤘 Nomenclatura consistente
- 🌙 Suporte a tema claro e escuro
- 🧪 Visualização com Storybook

> Compatível com **Flutter 3.32.x+**.

---

## Lista de componentes

## Atomos

| Componente                 | Descrição                                                       |
| -------------------------- | --------------------------------------------------------------- |
| RAvatar                    | Elemento visual representando o usuário.                        |
| RBadge                     | Indicador pequeno para mostrar contagem ou status.              |
| RBalanceDisplay            | Elemento para exibir saldo.                                     |
| RCard                      | Container para exibir conteúdo agrupado.                        |
| RCardFilled                | Container prenchido para exibir conteúdo agrupado.              |
| RCardOutlined              | Container realçado para exibir conteúdo agrupado.               |
| RCheckbox                  | Caixa de seleção para formulários.                              |
| RChipAssist                | Pequeno bloco de informação representando ações.                |
| RChipFilter                | Pequeno bloco de informação para filtrar conteúdo.              |
| RChipInput                 | Pequeno bloco de informação inseridos pelo usuário.             |
| RChipSuggestion            | Pequeno bloco de informação sugerida.                           |
| RDatePicker                | Componente para seleção de datas.                               |
| RTimePicker                | Componente para seleção de horário.                             |
| RDivider                   | Linha separadora para conteúdos.                                |
| RDropdownButton            | Botão para seleção de opções.                                   |
| RDropdownMenu              | Menu suspenso para seleção de opções.                           |
| RIcon                      | Ícone gráfico.                                                  |
| RImage                     | Elemento visual para exibição de imagens.                       |
| RLabel                     | Elemento para exibir textos.                                    |
| RCircularProgressIndicator | Indicador de progresso de formato circular.                     |
| RLinearProgressIndicator   | Indicador de progresso de formato linear.                       |
| RRadioButton               | Botão de seleção exclusiva.                                     |
| RRefreshIndicator          | Elemento para representar atualização da página.                |
| RRichText                  | Texto que pode incluir diferentes formatos, imagens, link, etc. |
| RSlider                    | Componente para seleção de valor.                               |
| RSliderRange               | Componente para seleção a partir de uma faixa de valores.       |
| RSwitch                    | Alterna a seleção de um item entre ativado ou desativado.       |
| RTextField                 | Área para entrada de texto.                                     |
| RTextFormField             | Área para entrada de texto em um formulário.                    |
| RTooltip                   | Informação adicional a ser.                                     |

## Moleculas

| Componente                    | Descrição                                                                     |
| ----------------------------- | ----------------------------------------------------------------------------- |
| RBottomSheet                  | Componente que desliza da parte de baixo da tela.                             |
| RElevatedButton               | Botão de ação elevado.                                                        |
| RIconButton                   | Botão de ação em forma de ícone.                                              |
| ROutlinedButton               | Botão de ação com borda realçada.                                             |
| RTextButton                   | Botão de ação em forma de texto.                                              |
| RFilledButton                 | Botão de ação com fundo preenchido.                                           |
| RFilledButtonTonal            | Botão de ação entre Filled e Outlined Button.                                 |
| RFloatingActionButton         | Botão de ação flutuante.                                                      |
| RFloatingActionButtonExtended | Botão de ação flutuante extendido.                                            |
| RCardCarousel                 | Carrossel específico de cards.                                                |
| RCaroussel                    | Carrossel.                                                                    |
| RDrawer                       | Container que se abre horizontalmente com conteúdo.                           |
| RExpansionTile                | Componente para exibir um item que se expande de uma lista.                   |
| RListTile                     | Componente para exibir um item de uma lista.                                  |
| RModal                        | Janela modal para exibir conteúdo adicional.                                  |
| RMoneyInput                   | Componente para entrada de valor monetário.                                   |
| ROtpTimer                     | Componente para exibição de código OTP.                                       |
| RPinInput                     | Componente para entrada de senha ou código.                                   |
| RSearchAnchor                 | Componente de pesquisa com sugestões.                                         |
| RSearchBar                    | Componente de pesquisa.                                                       |
| RShortcut                     | Container de atalho para outras seções do app.                                |
| RSnackBar                     | Exibe pequenas atualizações sobre processos do app na parte de baixo da tela. |
| RPrimaryTabBar                | Interface principal de navegação em abas.                                     |
| RSecondaryTabBar              | Interface secundária de navegação em abas.                                    |
| RTitleSubtitle                | Elemento para exibir título e subtítulo.                                      |
| RToast                        | Notificação transitória.                                                      |

## Organismos

| Componente          | Descrição                                                                        |
| ------------------- | -------------------------------------------------------------------------------- |
| RAppBar             | Elemento no topo da tela.                                                        |
| RBanner             | Elemento visual para destaque de algo.                                           |
| RCalendar           | Componente de calendário.                                                        |
| RDialog             | Container que oferece informações importantes ao usuário.                        |
| RDialogFullscreen   | Container que oferece informações importantes ao usuário e preenche toda a tela. |
| RSearchModal        | Janela modal para pesquisa.                                                      |
| RSliverAppBar       | Elemento no topo da tela flexível.                                               |
| RSliverAppBarMedium | Elemento no topo da tela flexível de tamanho médio.                              |
| RSliverAppBarLarge  | Elemento no topo da tela flexível de tamanho grande.                             |
| RTabPix             | Interface de navegação para ser usado no fluxo pix.                              |

## 🧪 Widgetbook
Para visualizar os componentes graficamente, utilize o projeto de Widgetbook.

🔗 Repositório
git@git.rarolabs.com.br:mobile/flutter/rarui-widgetbook.git

▶️ Rodar localmente
```bash
git clone git@git.rarolabs.com.br:mobile/flutter/rarui-widgetbook.git
cd rarui-widgetbook
flutter pub get
flutter run
```
O Widgetbook permite explorar todos os componentes de forma visual, facilitando testes e validações com o time de design.


## 🤝 Contribuindo
Clone o repositório:

```bash
git clone git@git.rarolabs.com.br:mobile/flutter/rarui.git
cd rarui
```
Crie uma nova branch:

```bash
git checkout -b feature/{id-da-task}/{nome-da-feature}
```
Faça alterações e commits:

```bash
git commit -m "feat: nova feature"
```
Suba para o GitLab:

```bash
git push origin feature/{id-da-task}/{nome-da-feature}
```
Abra um merge request no GitLab.

> _Feito com ❤️ pela RaroLabs_