<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/','PostController@viewPost');

Auth::routes();

Route::get('/home', 'PostController@viewPost')->name('home');

Route::get('/post','PostController@viewPost')->name('post');

Route::get('/viewPost','PostController@viewPost')->name('viewPost');

Route::get('/addPost','PostController@addPost')->name('addPost');
Route::post('/addPost','PostController@savePost')->name('savePost');

Route::get('/editPost/{id}','PostController@editPost')->name('editPost');
Route::post('/editPost/{id}','PostController@updatePost')->name('updatePost');

Route::get('/deletePost','PostController@deletePost')->name('deletePost');

Route::get('/searchUser/{id}','UserController@searchUser')->name('searchUser');
Route::get('/userPosts/{id}','UserController@userPosts')->name('userPosts');

Route::get('/myPosts','UserController@selfPosts')->name('myPosts');