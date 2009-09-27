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
		if (preg_match('/\.(html|wma)$/', $path)) $data []= $path;
	}
	return $data;
}

function collect($path)
{
	$aco = ACO_Load($path . '.aco');
	$icon = ($aco['Type'] == 'wma') ? 'audio.png' : 'doc.png';

	return Array(
		'title' => $aco['Title'],
		'description' => "<a href=\"$path\"><i>" . $aco['Describe'] . '</i></a>',
		'link' => $path,
		'start' => date('r', filemtime($path)),
		'caption' => $aco['Describe'],
		'icon' => $icon,
		'image' => random_image()
	);
}

function random_image()
{
	global $_flickr;
	if (!isset($_flickr))
	{
		$figures = Array('洪詩', '大元', '小ㄅ', '張育慈', '李毓芬', '美', '蝴蝶姊姊', '小嫻', '艾莉絲');
		$text = $figures[rand() % (count($figures) - 1)];

		$params = Array(
			'api_key' => 'a684601c8897ff8d057903dbb8dd599b',
			'format' => 'php_serial',
			'method' => 'flickr.photos.search',
			'text' => $text,
			'content_type' => '1',
			'per_page' => '50'
		);

		$encoded_params = Array();
		foreach ($params as $k => $v)
			$encoded_params []= urlencode($k) . '=' . urlencode($v);
	
		$_flickr = unserialize(file_get_contents(
			'http://api.flickr.com/services/rest/?' . implode('&', $encoded_params)
		));

		if ($_flickr['stat'] != 'ok') return '';
	}
	$photo = $_flickr['photos']['photo'][rand() % (count($_flickr['photos']['photo']) - 1)];

	return "http://farm{$photo['farm']}.static.flickr.com/{$photo['server']}/{$photo['id']}_{$photo['secret']}_t.jpg";
}
?>
