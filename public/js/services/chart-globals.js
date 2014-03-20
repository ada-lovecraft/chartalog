
angular.module('chartalog.chart')
	.constant('CHART_TYPES', [
		{ 'name': 'Bar', 'group': 'Bar' },
		{ 'name': 'Multi-Bar', 'group': 'Bar' },
		{ 'name': 'Multi-Bar (Horizontal)', 'group': 'Bar' },
		{ 'name': 'Cumulative Line', 'group': 'Line' },
		{ 'name': 'Line',	'group': 'Line' },
		{ 'name': 'Line with Focus', 'group': 'Line' },
		{ 'name': 'Stacked Area',	'group': 'Line' },
		{ 'name': 'Pie', 'group': 'Miscellaneous' },
		{ 'name': 'Scatter', 'group': 'Miscellaneous' },
		{ 'name': 'Sparkline', 'group': 'Miscellaneous' }
	])
	.constant('CHART_OPTION_CONVERSION', {
		'showXAxis': 'Show X Axis',
		'xLabel': 'X: Label',
		'xStagger': 'X: Stagger',
		'xHighlight': 'X: Highlight',

		'showYAxis': 'Show Y Axis',
		'yLabel': 'Y: Label',
		'yStagger': 'Y: Stagger',
		'yHighlight': 'Y: Highlight'
	})
	.constant('CHART_OPTIONS_AXIS', [
		{ 'name': 'Show X Axis', 'type': 'check', 'match': /./ },
		{ 'name': 'X: Label', 'type': 'text', 'match': /./, 'depends': 'showXAxis', 'dependsValue': true },
		{ 'name': 'X: Stagger', 'type': 'check', 'match': /./, 'depends': 'showXAxis', 'dependsValue': true },
		{ 'name': 'X: Highlight 0', 'type': 'check', 'match': /./, 'depends': 'showXAxis', 'dependsValue': true },

		{ 'name': 'Show Y Axis', 'type': 'check', 'match': /./ },
		{ 'name': 'Y: Label', 'type': 'text', 'match': /./, 'depends': 'showYAxis', 'dependsValue': true },
		{ 'name': 'Y: Stagger', 'type': 'check', 'match': /./, 'depends': 'showYAxis', 'dependsValue': true },
		{ 'name': 'Y: Highlight 0', 'type': 'check', 'match': /./, 'depends': 'showYAxis', 'dependsValue': true }
	]);