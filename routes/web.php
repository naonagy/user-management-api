<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return file_get_contents(public_path().'/index.html');
});
Route::get('/test', function () {
    return("test");
});