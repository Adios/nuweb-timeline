<?php
require '../../NUGroup_Prog/wnuweb.php';
echo json_encode(Array(
	'events' => array_map('collect', walk())
));

function walk($cwd = '.')
{
	$data = Array();
	$files = scandir($cwd);

	while(list(, $file) = each($files))
	{
		if (preg_match('/^\..*/', $file)) continue;

		$path = $cwd . '/' . $file;
		if (is_dir($path)) $data = array_merge($data, walk($path));
		if (preg_match('/\.html$/', $path)) array_push($data, $path);
	}
	return $data;
}

function collect($path)
{
	$aco = ACO_Load($path . '.aco');

	return Array(
		'title' => $aco['Title'],
		'description' => "<a href=\"$path\"><i>" . $aco['Describe'] . '</i></a>',
		'link' => $path,
		'start' => date('r', filemtime($path)),
		'caption' => $aco['Describe']
	);
}
?>
