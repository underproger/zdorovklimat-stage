<?php return array (
  '111300c800cdf8bb8ecfc51c27f2dd7f' => 
  array (
    'criteria' => 
    array (
      'name' => 'dateago',
    ),
    'object' => 
    array (
      'name' => 'dateago',
      'path' => '{core_path}components/dateago/',
      'assets_path' => '',
    ),
  ),
  'ab9925730664ecab12876b3510fe521f' => 
  array (
    'criteria' => 
    array (
      'name' => 'dateAgo',
    ),
    'object' => 
    array (
      'id' => 49,
      'source' => 1,
      'property_preprocess' => 0,
      'name' => 'dateAgo',
      'description' => '',
      'editor_type' => 0,
      'category' => 0,
      'cache_type' => 0,
      'snippet' => '/**
 * Formats date to "10 minutes ago" or "Yesterday in 22:10"
 * This algorithm taken from https://github.com/livestreet/livestreet/blob/7a6039b21c326acf03c956772325e1398801c5fe/engine/modules/viewer/plugs/function.date_format.php
 *
 * @var array $scriptProperties
 * @var string $input Date to format
 */
if (empty($input)) {
    return false;
}
if (!empty($options) && $options = $modx->fromJSON($options)) {
    $scriptProperties = array_merge($scriptProperties, $options);
}

require_once(MODX_CORE_PATH . \'components/dateago/include/declension.php\');
$modx->lexicon->load(\'dateago:default\');

$date = preg_match(\'/^\\d+$/\', $input)
    ? $input
    : strtotime($input);
$current = !empty($scriptProperties[\'current\'])
    ? $scriptProperties[\'current\']
    : time();
$dateFormat = $scriptProperties[\'dateFormat\'];
$delta = $current - $date;

if (!empty($scriptProperties[\'dateNow\']) && $delta > 0) {
    if ($delta < $scriptProperties[\'dateNow\']) {
        return $modx->lexicon(\'da_now\');
    }
}

if (!empty($scriptProperties[\'dateMinutes\']) && $delta > 0) {
    $minutes = round(($delta) / 60);
    if ($minutes < $scriptProperties[\'dateMinutes\']) {
        if ($minutes > 0) {
            return declension($minutes, $modx->lexicon(\'da_minutes\', array(\'minutes\' => $minutes)));
        } else {
            return $modx->lexicon(\'da_minutes_less\');
        }
    }
}

if (!empty($scriptProperties[\'dateHours\']) && $delta > 0) {
    $hours = round(($delta) / 3600);
    if ($hours < $scriptProperties[\'dateHours\']) {
        if ($hours > 0) {
            return declension($hours, $modx->lexicon(\'da_hours\', array(\'hours\' => $hours)));
        } else {
            return $modx->lexicon(\'da_hours_less\');
        }
    }
}

if (!empty($scriptProperties[\'dateDay\']) && $delta > 0) {
    switch (date(\'Y-m-d\', $date)) {
        case date(\'Y-m-d\'):
            $day = $modx->lexicon(\'da_today\');
            break;
        case date(\'Y-m-d\', mktime(0, 0, 0, date(\'m\'), date(\'d\') - 1, date(\'Y\'))):
            $day = $modx->lexicon(\'da_yesterday\');
            break;
        case date(\'Y-m-d\', mktime(0, 0, 0, date(\'m\'), date(\'d\') + 1, date(\'Y\'))):
            $day = $modx->lexicon(\'da_tomorrow\');
            break;
        default:
            $day = null;
    }
    if ($day) {
        $format = str_replace("day", preg_replace("#(\\w{1})#", \'\\\\\\${1}\', $day), $scriptProperties[\'dateDay\']);

        return date($format, $date);
    }
}

$month_arr = $modx->fromJSON($modx->lexicon(\'da_months\'));
$m = date("n", $date);
$month = $month_arr[$m - 1];

$format = preg_replace("~(?<!\\\\\\\\)F~U", preg_replace(\'~(\\w{1})~u\', \'\\\\\\${1}\', $month), $dateFormat);

return date($format, $date);',
      'locked' => 0,
      'properties' => 'a:6:{s:5:"input";a:7:{s:4:"name";s:5:"input";s:4:"desc";s:8:"da_input";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:0:"";s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}s:10:"dateFormat";a:7:{s:4:"name";s:10:"dateFormat";s:4:"desc";s:13:"da_dateFormat";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:10:"d F Y, H:i";s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}s:7:"dateNow";a:7:{s:4:"name";s:7:"dateNow";s:4:"desc";s:10:"da_dateNow";s:4:"type";s:11:"numberfield";s:7:"options";a:0:{}s:5:"value";i:10;s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}s:7:"dateDay";a:7:{s:4:"name";s:7:"dateDay";s:4:"desc";s:10:"da_dateDay";s:4:"type";s:9:"textfield";s:7:"options";a:0:{}s:5:"value";s:7:"day H:i";s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}s:11:"dateMinutes";a:7:{s:4:"name";s:11:"dateMinutes";s:4:"desc";s:14:"da_dateMinutes";s:4:"type";s:11:"numberfield";s:7:"options";a:0:{}s:5:"value";s:2:"59";s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}s:9:"dateHours";a:7:{s:4:"name";s:9:"dateHours";s:4:"desc";s:12:"da_dateHours";s:4:"type";s:11:"numberfield";s:7:"options";a:0:{}s:5:"value";s:2:"10";s:7:"lexicon";s:18:"dateago:properties";s:4:"area";s:0:"";}}',
      'moduleguid' => '',
      'static' => 0,
      'static_file' => 'core/components/dateago/elements/snippets/snippet.dateago.php',
      'content' => '/**
 * Formats date to "10 minutes ago" or "Yesterday in 22:10"
 * This algorithm taken from https://github.com/livestreet/livestreet/blob/7a6039b21c326acf03c956772325e1398801c5fe/engine/modules/viewer/plugs/function.date_format.php
 *
 * @var array $scriptProperties
 * @var string $input Date to format
 */
if (empty($input)) {
    return false;
}
if (!empty($options) && $options = $modx->fromJSON($options)) {
    $scriptProperties = array_merge($scriptProperties, $options);
}

require_once(MODX_CORE_PATH . \'components/dateago/include/declension.php\');
$modx->lexicon->load(\'dateago:default\');

$date = preg_match(\'/^\\d+$/\', $input)
    ? $input
    : strtotime($input);
$current = !empty($scriptProperties[\'current\'])
    ? $scriptProperties[\'current\']
    : time();
$dateFormat = $scriptProperties[\'dateFormat\'];
$delta = $current - $date;

if (!empty($scriptProperties[\'dateNow\']) && $delta > 0) {
    if ($delta < $scriptProperties[\'dateNow\']) {
        return $modx->lexicon(\'da_now\');
    }
}

if (!empty($scriptProperties[\'dateMinutes\']) && $delta > 0) {
    $minutes = round(($delta) / 60);
    if ($minutes < $scriptProperties[\'dateMinutes\']) {
        if ($minutes > 0) {
            return declension($minutes, $modx->lexicon(\'da_minutes\', array(\'minutes\' => $minutes)));
        } else {
            return $modx->lexicon(\'da_minutes_less\');
        }
    }
}

if (!empty($scriptProperties[\'dateHours\']) && $delta > 0) {
    $hours = round(($delta) / 3600);
    if ($hours < $scriptProperties[\'dateHours\']) {
        if ($hours > 0) {
            return declension($hours, $modx->lexicon(\'da_hours\', array(\'hours\' => $hours)));
        } else {
            return $modx->lexicon(\'da_hours_less\');
        }
    }
}

if (!empty($scriptProperties[\'dateDay\']) && $delta > 0) {
    switch (date(\'Y-m-d\', $date)) {
        case date(\'Y-m-d\'):
            $day = $modx->lexicon(\'da_today\');
            break;
        case date(\'Y-m-d\', mktime(0, 0, 0, date(\'m\'), date(\'d\') - 1, date(\'Y\'))):
            $day = $modx->lexicon(\'da_yesterday\');
            break;
        case date(\'Y-m-d\', mktime(0, 0, 0, date(\'m\'), date(\'d\') + 1, date(\'Y\'))):
            $day = $modx->lexicon(\'da_tomorrow\');
            break;
        default:
            $day = null;
    }
    if ($day) {
        $format = str_replace("day", preg_replace("#(\\w{1})#", \'\\\\\\${1}\', $day), $scriptProperties[\'dateDay\']);

        return date($format, $date);
    }
}

$month_arr = $modx->fromJSON($modx->lexicon(\'da_months\'));
$m = date("n", $date);
$month = $month_arr[$m - 1];

$format = preg_replace("~(?<!\\\\\\\\)F~U", preg_replace(\'~(\\w{1})~u\', \'\\\\\\${1}\', $month), $dateFormat);

return date($format, $date);',
    ),
  ),
);