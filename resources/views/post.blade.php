@extends('layouts.app')

@section('content')
    @unless (Auth::check())
    <div class="alert alert-danger alert-dismissible fade show container" role="alert">
        <strong>Holy guacamole!</strong> You should Login in to view.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endunless
    @auth
        
        @foreach($posts as $post)
        <div class="list-group container">
            @if ( $post->user->id === Auth::user()->id)
            <a href="/editPost?{{ $post->id }}" class="list-group-item list-group-item-action flex-column align-items-start active">
                <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{ $post->title }}</h5>
                <small>Posted by : {{ $post->user->name }}</small>
                </div>
                <p class="mb-1">{{ $post->body }}</small>
            </a>
            @else
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{ $post->title }}</h5>
                <small>Posted by : {{ $post->user->name }}</small>
                </div>
                <p class="mb-1">{{ $post->body }}</small>
            </a>
            @endif
            </div>
        @endforeach
    @endauth
@endsection