import 'package:flutter/material.dart';
import 'package:movescore/features/auth/presentation/screens/login_screen.dart';
import 'package:movescore/features/home/presentation/widgets/voucher_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _handleStartExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.fitness_center_rounded, color: Theme.of(context).colorScheme.primary, size: 28),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Sessão de Exercício IA',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        content: const Text(
          'Posicione seu celular e prepare-se para iniciar os movimentos guiados por Inteligência Artificial para acumular pontos!',
          style: TextStyle(fontSize: 16, height: 1.4, color: Color(0xFF555555)),
        ),
        actions: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(120, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Iniciando câmera e detecção de movimento por IA...',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                },
                child: const Text('Começar Agora', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleRedeemVoucher(String voucherTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Resgatar Voucher', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Text(
          'Deseja trocar seus pontos pelo voucher "$voucherTitle"?',
          style: const TextStyle(fontSize: 16, height: 1.4, color: Color(0xFF555555)),
        ),
        actions: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(120, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Voucher resgatado com sucesso! Verifique sua carteira.',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  );
                },
                child: const Text('Confirmar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Sair da Conta', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: const Text(
          'Deseja realmente sair do aplicativo MoveScore?',
          style: TextStyle(fontSize: 16, color: Color(0xFF555555)),
        ),
        actions: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(100, 48),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('Sair', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout_rounded, size: 28, color: secondaryColor),
          onPressed: _handleLogout,
          tooltip: 'Sair da conta',
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Maria Silva',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111111),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 18,
              backgroundColor: secondaryColor.withOpacity(0.15),
              child: Icon(Icons.person_rounded, size: 22, color: secondaryColor),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Saudação e Perfil
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: secondaryColor.withOpacity(0.15),
                    child: Icon(Icons.person_rounded, size: 36, color: secondaryColor),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Olá, Maria Silva!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF111111),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Mantenha-se ativa e ganhe benefícios.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF555555),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Card de Saldo de Pontos (Estética idêntica aos cards de login/cadastro)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [secondaryColor, secondaryColor.withOpacity(0.85)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryColor.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SEU SALDO DE PONTOS',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                              letterSpacing: 1.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '1.250 pts',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Equivalente a R\$ 60 em vouchers',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white70,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(Icons.card_giftcard_rounded, size: 36, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Botão de Iniciar Exercício com IA (Cor Principal Laranja)
              Builder(
                builder: (context) {
                  final screenSize = MediaQuery.of(context).size;
                  final isSmallScreen = screenSize.width < 360;
                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(double.infinity, isSmallScreen ? 54 : 64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      elevation: 4,
                    ),
                    onPressed: _handleStartExercise,
                    icon: Icon(Icons.play_arrow_rounded, size: isSmallScreen ? 26 : 32, color: Colors.white),
                    label: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Iniciar Exercício com IA',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 17 : 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Seção de Vouchers Disponíveis usando Expanded e Flexible
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Vouchers Disponíveis',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111111),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Exibindo todos os vouchers disponíveis.')),
                        );
                      },
                      child: Text(
                        'Ver todos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Lista de Vouchers usando VoucherCard
              VoucherCard(
                title: 'Desconto em Medicamentos',
                category: 'Farmácia Popular',
                discount: '25% OFF em remédios de uso contínuo',
                pointsCost: 500,
                icon: Icons.local_pharmacy_rounded,
                onTap: () => _handleRedeemVoucher('25% OFF na Farmácia Popular'),
              ),
              VoucherCard(
                title: 'Vale-Compras Supermercado',
                category: 'Alimentação',
                discount: 'R\$ 50 de desconto em compras acima de R\$ 200',
                pointsCost: 1000,
                icon: Icons.shopping_cart_rounded,
                onTap: () => _handleRedeemVoucher('R\$ 50 de Desconto no Supermercado'),
              ),
              VoucherCard(
                title: 'Sessão de Fisioterapia / Avaliação',
                category: 'Saúde e Bem-Estar',
                discount: '1 Consulta Postural Gratuita',
                pointsCost: 800,
                icon: Icons.favorite_rounded,
                onTap: () => _handleRedeemVoucher('Consulta Postural Gratuita'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Carteira de Vouchers aberta.')),
            );
          } else if (index == 2) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Histórico de Atividades aberto.')),
            );
          }
        },
        selectedItemColor: primaryColor,
        unselectedItemColor: const Color(0xFF777777),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 28),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded, size: 28),
            label: 'Vouchers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded, size: 28),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}
