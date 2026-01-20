// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rafaelgaedke/components/consent_dialog.dart';
// import 'package:rafaelgaedke/controllers/analytics_controller.dart';

// class AnalyticsDashboard extends StatelessWidget {
//   const AnalyticsDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard de Analytics'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text('Confirmar'),
//                   content: const Text('Tem certeza que deseja excluir todos os dados?'),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text('Cancelar'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         controller.clearAllData();
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Excluir'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             tooltip: 'Limpar dados',
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (!controller.hasConsent.value) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.privacy_tip, size: 64, color: Colors.grey),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Consentimento necessário',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 const Text(
//                   'Para visualizar os dados de analytics, é necessário consentir com a coleta de dados.',
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: () => showDialog(
//                     context: context,
//                     builder: (context) => const ConsentDialog(),
//                   ),
//                   child: const Text('Solicitar Consentimento'),
//                 ),
//               ],
//             ),
//           );
//         }

//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildStatsCards(controller),
//               const SizedBox(height: 24),
//               _buildCharts(controller),
//               const SizedBox(height: 24),
//               _buildDataTables(controller),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   Widget _buildStatsCards(AnalyticsController controller) {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildStatCard(
//             'Total de Visitas',
//             controller.totalVisits.toString(),
//             Icons.visibility,
//             Colors.blue,
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: _buildStatCard(
//             'Interações',
//             controller.totalInteractions.toString(),
//             Icons.touch_app,
//             Colors.green,
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: _buildStatCard(
//             'Eventos',
//             controller.totalEvents.toString(),
//             Icons.analytics,
//             Colors.orange,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Icon(icon, size: 32, color: color),
//             const SizedBox(height: 8),
//             Text(
//               value,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text(title, style: const TextStyle(fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCharts(AnalyticsController controller) {
//     return Row(
//       children: [
//         Expanded(
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Dispositivos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 16),
//                   ...controller.getDeviceTypeStats().entries.map((entry) => _buildStatRow(entry.key, entry.value)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Navegadores', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 16),
//                   ...controller.getBrowserStats().entries.map((entry) => _buildStatRow(entry.key, entry.value)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatRow(String label, int value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label),
//           Text(value.toString()),
//         ],
//       ),
//     );
//   }

//   Widget _buildDataTables(AnalyticsController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Páginas Mais Visitadas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 16),
//         Card(
//           child: DataTable(
//             columns: const [
//               DataColumn(label: Text('Página')),
//               DataColumn(label: Text('Visitas')),
//             ],
//             rows: controller
//                 .getPageStats()
//                 .entries
//                 .map((entry) => DataRow(
//                       cells: [
//                         DataCell(Text(entry.key)),
//                         DataCell(Text(entry.value.toString())),
//                       ],
//                     ))
//                 .toList(),
//           ),
//         ),
//         const SizedBox(height: 24),
//         const Text('Tipos de Interação', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 16),
//         Card(
//           child: DataTable(
//             columns: const [
//               DataColumn(label: Text('Tipo')),
//               DataColumn(label: Text('Quantidade')),
//             ],
//             rows: controller
//                 .getInteractionStats()
//                 .entries
//                 .map((entry) => DataRow(
//                       cells: [
//                         DataCell(Text(entry.key)),
//                         DataCell(Text(entry.value.toString())),
//                       ],
//                     ))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
