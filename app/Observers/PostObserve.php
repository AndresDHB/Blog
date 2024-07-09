<?php

namespace App\Observers;

use App\Models\Post;

class PostObserve
{
    public function creating(Post $post)
    {
        $post->user_id = auth()->user()->id;
    }
}
