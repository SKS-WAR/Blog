@extends('layouts.app')

@section('content')
    @if (Session::has('msg'))
        <div class="col-md-12">
            <div class='alert alert-success'>
                {{ Session::get('msg')}}
            </div>
        </div>
    @endif


    <div class="card">
        <div class="card-header">
            <h5>Add a new Post</h5>
        </div>
        <div class="card-body">
            <form action="{{ route('savePost') }}" method="post" name="addPost" id="addPost">
                @csrf
                <div class="form-group">
                    <label for="">Title</label>
                    <input type="text" name="title" id="title" value="{{ old('title') }}" class="form-control {{ ($errors->any() && $errors->first('title'))?'is-invalid':'' }}">
                    @if ($errors->any)
                        <p class="invalid-feedback">{{ $errors->first('title') }}</p>
                    @endif
                </div>
                <div class="form-group">
                    <label for="">Note</label>
                    <textarea type="text" rows="7" name="body" id="body" class="form-control {{ ($errors->any() && $errors->first('body'))?'is-invalid':'' }}">{{ old('body') }}</textarea>
                    @if ($errors->any)
                        <p class="invalid-feedback">{{ $errors->first('body') }}</p>
                    @endif
                </div>
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-outline-primary">Save Note</button>
                </div>
            </form>
        </div>
    </div>
@endsection