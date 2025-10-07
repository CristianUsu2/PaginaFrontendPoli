<?php
header('Content-Type: application/json; charset=utf-8');
$dataFile = __DIR__ . '/../data/services.json';

if (!file_exists($dataFile)) {
    echo json_encode([]);
    exit;
}

$raw = file_get_contents($dataFile);
if ($raw === false) {
    echo json_encode(["error" => "No se pudo leer el archivo"]);
    exit;
}

echo $raw;
