import 'package:country_flags/country_flags.dart';
import 'package:culterra/screens/Country/data/models/CulterraUser.dart';
import 'package:culterra/screens/Country/data/models/role.dart';
import 'package:culterra/screens/Profile/domain/helpers/countryCodeHelper.dart';
import 'package:culterra/screens/Profile/presentation/profileViewModel.dart';
import 'package:culterra/screens/Widgets/roleCard.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/entities/uiState.dart';

class ProfileSheet extends StatelessWidget {
  final ScrollController scrollController;

  const ProfileSheet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer<ProfileViewModel>(
              builder: (context, viewModel, child) {
                final state = viewModel.userState;

                if (state is UiLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UiError<CulterraUser>) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is UiSuccess<CulterraUser>) {
                  final user = state.data;

                  return Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      profileSection(user),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () async {
                          if (user.role == Role.explorer) {
                            const url =
                                'https://docs.google.com/forms/d/e/1FAIpQLSfNCKom9YO2Z8lhDU6948vo1RzGd7rEl6ea0ussQD0RPHNQag/viewform?usp=header';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              // Optional: show error if URL can't be launched
                              debugPrint('Could not launch $url');
                            }
                          }
                        },
                        child: RoleCard(role: user.role),
                      ),
                      const SizedBox(height: 16),
                      informationBuilder(
                        "Name",
                        user.displayName ?? "Anonymous",
                      ),
                      informationBuilder("Nationality", user.nationality),
                      informationBuilder("Email", user.email ?? ""),
                      informationBuilder("Phone", user.phone ?? ""),
                      Row(
                        children: [Spacer(), logoutButton(context), Spacer()],
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget profileSection(CulterraUser user) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  user.photoURL != null && user.photoURL!.isNotEmpty
                      ? NetworkImage(user.photoURL!)
                      : null,
              child:
                  (user.photoURL == null || user.photoURL!.isEmpty)
                      ? Icon(Icons.person, color: Colors.grey[700])
                      : null,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200, // Set a fixed width or use a max width constraint
                  child: Text(
                    user.displayName ?? "Anonymous",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow:
                        TextOverflow
                            .ellipsis, // Optionally, you can use ellipsis
                    softWrap:
                        true, // Allow text to wrap to the next line if it overflows
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
      ],
    );
  }

  Widget informationBuilder(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16), // adjust padding as needed
      decoration: BoxDecoration(
        color: Colors.grey[200], // light background
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                value.toCountryName(),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Spacer(),
          title == "Nationality"
              ? CountryFlag.fromCountryCode(
                shape: const RoundedRectangle(8),
                value,
                width: 100,
                height: 50,
              )
              : Container(),
        ],
      ),
    );
  }

  Widget logoutButton(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () async {
          await context.read<ProfileViewModel>().logout(context);
        },
        icon: const Icon(Icons.logout),
        label: const Text("Logout"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
