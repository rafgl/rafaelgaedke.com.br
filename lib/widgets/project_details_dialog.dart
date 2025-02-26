import 'package:flutter/material.dart';
import 'package:rafaelgaedke/models/project_data.dart';
import 'package:rafaelgaedke/utils/colors.dart';

class ProjectDetailsDialog extends StatelessWidget {
  final ProjectData project;

  const ProjectDetailsDialog({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 800 ? 800.0 : constraints.maxWidth;

        return Container(
          width: width,
          constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with image
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      project.imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: const Icon(Icons.image_not_supported, size: 80),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.white, size: 28),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ],
              ),

              // Content
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and category
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                project.title,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff3d4154),
                                ),
                              ),
                            ),
                            Chip(
                              label: Text(project.category),
                              backgroundColor: MyColors.red.withOpacity(0.1),
                              labelStyle: const TextStyle(color: MyColors.red),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Technologies
                        const Text(
                          'Tecnologias',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3d4154),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.technologies
                              .map((tech) => Chip(
                                    label: Text(tech),
                                    backgroundColor: Colors.grey[100],
                                    side: BorderSide.none,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 24),

                        // Details
                        const Text(
                          'Sobre o Projeto',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3d4154),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          project.details,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Color(0xff5A5A5A),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Features
                        const Text(
                          'Funcionalidades',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3d4154),
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...project.features.map((feature) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: MyColors.red,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff5A5A5A),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 24),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  // final uri = Uri.parse(project.projectUrl);
                                  // if (await canLaunchUrl(uri)) {
                                  //   await launchUrl(uri);
                                  // }
                                },
                                icon: const Icon(Icons.open_in_new),
                                label: const Text('Ver Projeto'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.red,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
