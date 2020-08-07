<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Post;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Collection;
use DB;


class UserController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function searchUser($id,Request $request){
        
        $users = DB::table('users')
                    ->where('name',$id)
                    ->orWhere('batch',$id)
                    ->orWhere('id',$id)
                    ->orWhere('email',$id)
                    ->get();
        
        // $users = DB::table('users')
        //             ->where('batch',$id)
        //             ->union($usersById)
        //             ->get();

        return view('search',['users' => $users]);
    }

    public function selfPosts(){
        $posts = Post::where('user_id',Auth::user()->id)->get()->reverse();
        // return $posts;
        return view('myPosts',['posts' => $posts]); 
    }

    public function userPosts($id, Request $request){
        $posts = Post::where('user_id',$id)->get()->reverse();
        return view('myPosts',['posts' => $posts]);
    }
}
