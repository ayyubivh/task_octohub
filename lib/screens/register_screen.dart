import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_octohub/bloc/registration_state.dart';
import 'package:task_octohub/const.dart';
import 'package:task_octohub/screens/main_screen.dart';
import '../bloc/registration_bloc.dart';
import '../bloc/registration_event.dart';
import '../data/registration_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _companyTaxNoController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration', // Fixed typo in title
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            showAlert(
                context, 'Success', 'Registration completed successfully!');
          } else if (state is RegistrationFailure) {
            showAlert(context, 'Error', state.error);
          }
        },
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionHeader('Personal Information'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _userNameController,
                              placeholder: 'Username',
                              keyboardType: TextInputType.name,
                              validator: (value) => value?.isEmpty ?? true
                                  ? 'Please enter username'
                                  : null,
                            ),
                            _buildTextField(
                              controller: _emailController,
                              placeholder: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value!)) {
                                  return 'Please enter valid email';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              controller: _passwordController,
                              placeholder: 'Enter your password',
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: Color(0xFF757575)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF757575),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter password';
                                }
                                if (value!.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              controller: _mobileController,
                              placeholder: 'Mobile Number',
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'Please enter mobile number';
                                }
                                if (!RegExp(r'^\d{10}$').hasMatch(value!)) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSectionHeader('Company Information'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _companyNameController,
                              placeholder: 'Company Name',
                              keyboardType: TextInputType.name,
                              validator: (value) => value?.isEmpty ?? true
                                  ? 'Please enter company name'
                                  : null,
                            ),
                            _buildTextField(
                              controller: _companyTaxNoController,
                              placeholder: 'Company Tax Number',
                              keyboardType: TextInputType.text,
                              validator: (value) => value?.isEmpty ?? true
                                  ? 'Please enter company tax number'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      BlocBuilder<RegistrationBloc, RegistrationState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: CupertinoButton.filled(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              onPressed: state is RegistrationLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final request = RegistrationRequest(
                                          userName: _userNameController.text,
                                          emailId: _emailController.text,
                                          password: _passwordController.text,
                                          mobile: _mobileController.text,
                                          company: Company(
                                            companyName:
                                                _companyNameController.text,
                                            companyCountry: 'IN',
                                            companyTaxNo:
                                                _companyTaxNoController.text,
                                          ),
                                          address: Address(
                                            address1:
                                                'Mumbai, Maharashtra 400099, India',
                                            country: 'India',
                                            state: 'Maharashtra',
                                            city: 'Mumbai Suburban',
                                            zipCode: '400099',
                                            latitude: 19.0902177,
                                            longitude: 72.86281199999999,
                                          ),
                                        );
                                        context.read<RegistrationBloc>().add(
                                              SubmitRegistration(request),
                                            );
                                      }
                                    },
                              child: state is RegistrationLoading
                                  ? CircularProgressIndicator()
                                  : const Text('Register',
                                      style: TextStyle(fontSize: 16)),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2B2B2B),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String placeholder,
    required TextInputType keyboardType,
    String? Function(String?)? validator,
    bool isPassword = false,
    String? label,
    Widget? prefixIcon,
    Widget? suffixIcon,
    int? maxLength,
    TextInputAction? textInputAction,
    void Function(String)? onChanged,
    void Function(String)? onSubmitted,
    bool isEnabled = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2B2B2B),
                ),
              ),
            ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            obscureText: isPassword,
            enabled: isEnabled,
            maxLength: maxLength,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF2B2B2B),
            ),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: isEnabled ? Colors.white : const Color(0xFFF5F5F5),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              errorStyle: const TextStyle(
                color: Color(0xFFE53935),
                fontSize: 12,
              ),
              counterText: '',
            ),
          ),
        ],
      ),
    );
  }

  void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MainScreen(),
            )),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    _companyNameController.dispose();
    _companyTaxNoController.dispose();
    super.dispose();
  }
}
