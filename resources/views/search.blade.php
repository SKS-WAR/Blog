@extends('layouts.app')

@section('content')
    @if (Session::has('msg'))
        <div class="col-md-12">
            <div class='alert alert-success'>
                {{ Session::get('msg')}}
            </div>
        </div>
    @endif
    @if (Session::has('errorMsg'))
        <div class="col-md-12">
            <div class='alert alert-danger'>
                {{ Session::get('errorMsg')}}
            </div>
        </div>
    @endif

    @unless (Auth::check())
    <div class="alert alert-danger alert-dismissible fade show container" role="alert">
        <strong>Holy guacamole!</strong> You should Login in to view.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endunless
    @auth
        <div class="container">
            @foreach ($users as $user)
                <div class=" container">
                    
                    <div class="card  mb-4 box-shadow">
                        <h3 class="mb-0 card-header">
                            <a class="text-dark" href="#">{{ $user->name }}</a>
                        </h3>
                        <div class="card-body flex-column align-items-start">
                            <div class="row">
                                <div class="col-md-6 text-center text-md-left float-md-left">
                                    <p class="card-text mb-auto">Email ID : {{ $user->email }}</p>
                                    <p class="card-text mb-auto">ID: {{ $user->id }}</p>
                                    <a href="#" >View Notes</a>
                                </div>
                                <div class="col-md-6 text-center text-md-right float-md-right">
                                    <div class="mb-1 text-muted">Joined On : {{ $user->created_at }}</div>
                                    <div class="mb-1 text-muted">Batch : {{ $user->batch }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endauth
@endsection