<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    //
    public function index(){
        $posts = Post::all();

        return view('posts/index');
    }

    public function viewPost(){
        // $posts = Post::all();
        $posts = Post::orderBy('id','DESC')->get();
        return view('posts/view',['posts' => $posts]);
    }

    public function addPost(){
        $posts = Post::all();
        return view('posts/add');
    }
    public function savePost(Request $request){
        $validator = Validator::make($request->all(),[
            'title'=>'required|max:255',
            'body' =>'required',           
        ]);

        if($validator->passes()){
            //Insert data
            $post = new Post;
            $post->title =$request->title;
            $post->body =$request->body;
            $post->user_id = Auth::id();
            $post->save();

            $request->session()->flash('msg','Article saved successfully');
            return redirect('viewPost');

        }else{
            //returns the error
            return redirect('addPost')->withErrors($validator)->withInput();
        }

        // dd($request->all());

    }

    public function editPost($id,Request $request){
        $post = Post::where('id',$id)->first();

        if(!$post){
            $request->session()->flash('errorMsg','Record Not Found.');
            return redirect('viewPost');
        }

        return view('posts/edit')->with(compact('post'));
    }
    public function updatePost($id,Request $request){
        $validator = Validator::make($request->all(),[
            'title'=>'required|max:255',
            'body' =>'required',           
        ]);

        if($validator->passes()){
            //Insert data
            $post = Post::find($id);
            $post->title =$request->title;
            $post->body =$request->body;
            $post->user_id = Auth::id();
            $post->save();

            $request->session()->flash('msg','Article saved successfully');
            return redirect('viewPost');

        }else{
            //returns the error
            return redirect('editPost/'.$id)->withErrors($validator)->withInput();
        }

    }

    public function deletePost(){
        $posts = Post::all();
        return view('posts/view',['posts' => $posts]);
    }
}

