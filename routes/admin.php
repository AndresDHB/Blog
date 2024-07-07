<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\AdminController;
use Illuminate\Support\Facades\Route;

Route::get('/',[AdminController::class, 'index'])->name('admin.index');

Route::resource('/categories', CategoryController::class);
