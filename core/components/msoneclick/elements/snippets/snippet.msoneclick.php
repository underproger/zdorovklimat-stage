<?php
$selector   = $modx->getOption('selector', 'oneClick', $scriptProperties['selector']);
$tplBtn     = $modx->getOption('tplBtn', 'tpl.msOneClick.btn', $scriptProperties['tplBtn']);


/* @var msOneClick $msOneClick*/
if (!isset($modx->msoneclick)) {
	if (!$msOneClick = $modx->getService('msoneclick')) {
		return 'Could not load msOneClick class!';
	}
	$msOneClick->initialize('web', $scriptProperties);
	$modx->msoneclick = $msOneClick;
} else {
	$msOneClick = $modx->msoneclick;
}


/* @var pdoFetch $pdoFetch */
if (!$modx->loadClass('pdofetch', MODX_CORE_PATH . 'components/pdotools/model/pdotools/', false, true)) {return false;}
$pdoFetch = new pdoFetch($modx, $scriptProperties);


if (empty($id)) {
	if ($modx->resource->class_key == 'msProduct') {
		$id = $modx->resource->id;
	}
}

if (!empty($id)) $id = (int)$id;

if (empty($id)) return 'укажите id товара!';
if (empty($tplBtn)) return 'Чанк "tplBtn" для кнопки не указан';



$hash = $msOneClick->getHastBtn($scriptProperties);
if (empty($hash)) return 'Не удалось получить hash кнопки';

$data = array(
	'id' 		=> $id,
	'selector' 	=> $selector,
);
$msOneClick->setConfig($hash, $scriptProperties, $data);
$data['hash'] = $hash;

if (!isset($_SESSION['msOneClickConfig'][$hash])) {
	$msOneClick->setConfig($hash, $scriptProperties, $data);
}

// out btn
$output = $pdoFetch->getChunk($tplBtn, $data, $pdoFetch->config['fastMode']);

return $output;