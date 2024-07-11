<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;

class TagsController extends Controller
{
    public function show(Request $request)
    {
        $term = $request->term ?? '';

        $tags = Tag::select()
        ->where('nombre', 'LIKE', '%'.$term.'%')
        ->limit(10)
        ->get();

        return response()->json($tags);
    }
}
