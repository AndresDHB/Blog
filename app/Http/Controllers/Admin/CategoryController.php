<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::latest()->paginate();

        return view('admin.categories.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.categories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => ['required', 'string', 'max:255', 'unique:categories,nombre']
        ]);

        Category::create($request->all());

        session()->flash('sweet',[
            'icon' => 'success',
            'title' => 'Registro exitoso',
            'text' => 'Se ha creado la categoria exitosamente',
        ]);

        return redirect()->route('admin.categories.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Category $category)
    {
        return view('admin.categories.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        $request->validate([
            'nombre' => ['required', 'string', 'max:255', Rule::unique('categories')->ignore($category->id)]
        ]);
        
        $category->update($request->all());

        session()->flash('sweet',[
            'icon' => 'success',
            'title' => 'Actualizacion exitosa',
            'text' => 'Se ha actualizado la categoria exitosamente',
        ]);

        return redirect()->route('admin.categories.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        $posts = Post::where('category_id', $category->id)->exists();

        if(!$posts){

            $category->delete();

            session()->flash('sweet',[
                'icon' => 'success',
                'title' => 'Eliminacion exitosa',
                'text' => 'Se elimino la categoria exitosamente',
            ]);

        }else{

            session()->flash('sweet',[
                'icon' => 'error',
                'title' => 'Ops',
                'text' => 'No puedes eliminar esta categoria, puesto a que tiene posts asociados',
            ]);

        }

        return redirect()->route('admin.categories.index');
    }
}
