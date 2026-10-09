import 'package:flutter/material.dart';
import '../widgets/accessible_button.dart';
import '../widgets/accessible_text_field.dart';
import '../../../home/presentation/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // 1. try/finally: garante reset de _isLoading.
  // 2. if (mounted): evita exceção de ciclo de vida após await.
  // 3. Gerência de Estado: botões bloqueados durante carregamento.
  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      // Simulando registro com o backend Spring Boot (Limiar de Doherty)
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Cadastro realizado com sucesso! Bem-vindo ao MoveScore.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao realizar cadastro: $e'),
          backgroundColor: Colors.red[700],
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 32, color: secondaryColor),
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          tooltip: 'Voltar',
        ),
        title: Text(
          'Criar Conta',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Cadastre-se gratuitamente para começar a acumular pontos e trocar por vouchers.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF555555),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 28),

                // Nome Completo
                AccessibleTextField(
                  label: 'Nome Completo',
                  hint: 'Digite seu nome completo',
                  prefixIcon: Icons.badge_outlined,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe seu nome completo.';
                    }
                    if (value.trim().split(' ').length < 2) {
                      return 'Por favor, informe ao menos nome e sobrenome.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // E-mail ou Celular
                AccessibleTextField(
                  label: 'E-mail ou Celular',
                  hint: 'seu@email.com ou (11) 98765-4321',
                  prefixIcon: Icons.contact_mail_outlined,
                  controller: _contactController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe seu e-mail ou celular.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Senha
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Crie uma Senha',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: const TextStyle(fontSize: 18, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Mínimo de 4 caracteres',
                        prefixIcon: Icon(Icons.lock_outline_rounded, size: 28, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            size: 26,
                            color: const Color(0xFF555555),
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: secondaryColor, width: 2.5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, crie uma senha.';
                        }
                        if (value.length < 4) {
                          return 'A senha deve ter pelo menos 4 caracteres.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Confirmar Senha
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Confirme a Senha',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      style: const TextStyle(fontSize: 18, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Digite a senha novamente',
                        prefixIcon: Icon(Icons.lock_reset_rounded, size: 28, color: secondaryColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            size: 26,
                            color: const Color(0xFF555555),
                          ),
                          onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: secondaryColor, width: 2.5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, confirme sua senha.';
                        }
                        if (value != _passwordController.text) {
                          return 'As senhas não coincidem.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Botão de Cadastro (Laranja / Primary)
                AccessibleButton(
                  label: 'Finalizar Cadastro',
                  onPressed: _handleRegister,
                  isLoading: _isLoading,
                  backgroundColor: primaryColor,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
