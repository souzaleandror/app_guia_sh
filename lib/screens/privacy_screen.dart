import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //drawer: CustomDrawer(_pageController),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text("Política de Privacidade",
              style: TextStyle(shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ])),
          backgroundColor: Colors.orange,
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share("Guia 66");
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                child: Column(
              children: <Widget>[
                // Secao 1
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 1 - O QUE FAREMOS COM ESTA INFORMAÇÃO?",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.1	Quando você realiza alguma transação com nossa empresa, como parte do processo de compra e venda, coletamos as informações pessoais que você nos dá tais como: nome, e-mail e endereço.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.2	Quando você acessa nosso site, também recebemos automaticamente o protocolo de internet do seu computador, endereço de IP, a fim de obter informações que nos ajudam a aprender sobre seu navegador e sistema operacional.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1.3	E-mail Marketing será realizado apenas caso você permita. Nestes e-mails você poderá receber notícia sobre nossa empresa, novos produtos e outras atualizações.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                // Secao 2
                SizedBox(
                  height: 30,
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 2 - CONSENTIMENTO",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "2.1	Como vocês obtêm meu consentimento?\n\n2.1.1	Quando você fornece informações pessoais como nome, telefone e endereço, para completar: uma transação, verificar seu cartão de crédito, fazer um pedido, providenciar uma entrega ou retornar uma compra. Após a realização de ações entendemos que você está de acordo com a coleta de dados para serem utilizados pela nossa empresa.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "2.1.2	Se pedimos por suas informações pessoais por uma razão secundária, como marketing, vamos lhe pedir diretamente por seu consentimento, ou lhe fornecer a oportunidade de dizer não.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "2.2	E caso você queira retirar seu consentimento, como proceder?\n\n2.2.1	Se após você nos fornecer seus dados, você mudar de ideia, você pode retirar o seu consentimento para que possamos entrar em contato, para a coleção de dados contínua, uso ou divulgação de suas informações, a qualquer momento, entrando em contato conosco em ti@guia66.com.br.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 3
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 3 - DIVULGAÇÃO",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "3.1	Podemos divulgar suas informações pessoais caso sejamos obrigados pela lei para fazê-lo ou se você violar nossos Termos de Serviço.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 4
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 4 - SERVIÇOS DE TERCEIROS",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "4.1	No geral, os fornecedores terceirizados usados por nós irão apenas coletar, usar e divulgar suas informações na medida do necessário para permitir que eles realizem os serviços que fornecem. Entretanto, certos fornecedores de serviços terceirizados, tais como gateways de pagamento e outros processadores de transação de pagamento, têm suas próprias políticas de privacidade com respeito à informação que somos obrigados a fornecer para eles de suas transações relacionadas com compras.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "4.2	Para esses fornecedores, recomendamos que você leia suas políticas de privacidade para que você possa entender a maneira na qual suas informações pessoais serão usadas por esses fornecedores.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "4.3	Em particular, lembre-se que certos fornecedores podem ser localizados em ou possuir instalações que são localizadas em jurisdições diferentes que você ou nós. Assim, se você quer continuar com uma transação que envolve os serviços de um fornecedor de serviço terceirizado, então suas informações podem tornar-se sujeitas às leis da(s) jurisdição(ões) nas quais o fornecedor de serviço ou suas instalações estão localizados.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "4.4	Como um exemplo, se você está localizado no Canadá e sua transação é processada por um gateway de pagamento localizado nos Estados Unidos, então suas informações pessoais usadas para completar aquela transação podem estar sujeitas a divulgação sob a legislação dos Estados Unidos, incluindo o Ato Patriota.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "4.5	Uma vez que você deixe o site da nossa loja ou seja redirecionado para um aplicativo ou site de terceiros, você não será mais regido por essa Política de Privacidade ou pelos Termos de Serviço do nosso site.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 5
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 5 – LINKS",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "5.1	Quando você clica em links na nossa loja, eles podem lhe direcionar para fora do nosso site. Não somos responsáveis pelas práticas de privacidade de outros sites e lhe incentivamos a ler as declarações de privacidade deles.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 6
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 6 - SEGURANÇA",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "6.1	Para proteger suas informações pessoais, tomamos as melhores precauções e seguimos as melhores práticas da indústria, para nos certificar que elas não serão perdidas, usurpadas, acessadas, divulgadas, alteradas ou destruídas.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "6.2	Se você nos fornece as suas informações de cartão de crédito, essa informação é criptografada usando tecnologia 'secure socket layersemanticsLabel: ' (SSL) e armazenada com uma criptografia AES-256. Embora nenhum método de transmissão pela Internet ou armazenamento eletrônico é 100% seguro, nós seguimos todos os requisitos da PCI-DSS e implementamos padrões adicionais aceitos pela indústria.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 7
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 7 - ALTERAÇÕES PARA ESSA POLÍTICA DE PRIVACIDADE",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "7.1	Reservamos o direito de modificar essa política de privacidade a qualquer momento, então por favor, revise-a com frequência. Alterações e esclarecimentos vão surtir efeito imediatamente após sua publicação no site.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "7.2	Se fizermos alterações de materiais para essa política, iremos notificá-lo que eles foram atualizados, para que você tenha ciência sobre quais informações coletamos, como as usamos, e sob que circunstâncias, se alguma, usamos e/ou divulgamos elas.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "7.3	Se nossa loja for adquirida ou fundida com outra empresa, suas informações podem ser transferidas para os novos proprietários para que possamos continuar nossos acordos.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
                // Secao 8
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "SEÇÃO 8 - POLITICA DE CANCELAMENTO",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "8.1	O Comprador tem o prazo de 7 dias corridos antes do termino da assinatura para solicitar via e-mail o cancelamento da próxima compra efetuada via cartão de crédito.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "8.2	Fica sob responsabilidade do Comprador solicitar o cancelamento dentro do prazo determinado.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "8.3	Se efetuado o estorno da compra, poderá ser estornado da fatura em até 2 meses após a data da compra.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "8.4	Se houver compra de pacotes como 6 ou 12 meses ou superiores e o contrato for quebrado durante o tempo contratado, os meses restantes não serão estornados devido à quebra de contrato, mas por suas politicas de privacidade seus dados poderão ser removidos caso deseje.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]),
              ],
            )),
          ),
        ));
  }
}
