<?php
/**
 * zkObjectCats — напрями (категорії) розділу «Об’єкти» з кількістю опублікованих об’єктів.
 * &parent — id розділу «Об’єкти». Повертає JSON: [{"id":..,"name":"..","n":..}, ...]
 * Назва — з лексикону zk.cat.<id> (коротка), інакше menutitle / pagetitle.
 */
$parent = (int) $modx->getOption('parent', $scriptProperties, 0);
if (!$parent) {
    return '[]';
}
$modx->lexicon->load('zdorovklimat:home');
$q = $modx->newQuery('modResource');
$q->where(['parent' => $parent, 'published' => 1, 'deleted' => 0, 'isfolder' => 1]);
$q->sortby('menuindex', 'ASC');
$out = [];
foreach ($modx->getCollection('modResource', $q) as $r) {
    $n = $modx->getCount('modResource', ['parent' => $r->get('id'), 'published' => 1, 'deleted' => 0]);
    if (!$n) {
        continue;
    }
    $key = 'zk.cat.' . $r->get('id');
    $name = $modx->lexicon($key);
    if ($name === $key) {
        $name = $r->get('menutitle') ?: $r->get('pagetitle');
    }
    $out[] = ['id' => (int) $r->get('id'), 'name' => $name, 'n' => $n];
}
return json_encode($out, JSON_UNESCAPED_UNICODE);