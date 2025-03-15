<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    try {
        return response()->file(public_path('index.html'));
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
});