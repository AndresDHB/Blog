<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::latest()->paginate(5);
        return view('admin.posts.index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        return view('admin.posts.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request->validate([
            'titulo' => ['required'],
            'slug' => ['required', 'unique:posts,slug'],
            'category_id' => ['required', 'exists:categories,id'],
        ]);

        $post = Post::create($request->all());

        session()->flash('sweet', [
            'icon' => 'success',
            'title' => 'Registro exitoso',
            'text' => 'Se ha creado el post exitosamente',
        ]);

        return redirect()->route('admin.posts.edit', $post);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('admin.posts.edit', compact('post', 'categories', 'tags'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        dd($request->all());
        $request->validate([
            'titulo' => ['required'],
            'slug' => ['required', 'unique:posts,slug,' . $post->id],
            'category_id' => ['required', 'exists:categories,id'],
            'resumen' => $request->publicado ? 'required' : 'nullable',
            'cuerpo' => $request->publicado ? 'required' : 'nullable',
            'tags' => $request->publicado ? 'required' : 'nullable', 'array',
            'publicado' => ['required', 'boolean'],
        ]);

        if ($request->publicado) {
            $post->tags()->sync($request->tags);
        }
        session()->flash('sweet', [
            'icon' => 'success',
            'title' => 'Actualizacio exitosa',
            'text' => 'Se ha actualizado el post exitosamente',
        ]);

        return redirect()->route('admin.posts.edit', $post);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        $post->delete();

        session()->flash('sweet', [
            'icon' => 'success',
            'title' => 'Eliminacion exitosa',
            'text' => 'Se elimino el articulo exitosamente',
        ]);

        return redirect()->route('admin.posts.index');
    }
}
