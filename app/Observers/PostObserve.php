<?php

namespace App\Observers;

use App\Models\Post;

class PostObserve
{
    public function creating(Post $post)
    {
        $post->user_id = auth()->user()->id;
    }

    public function updating(Post $post)
    {
        if($post->publicado == 1){
            $post->publicado_at = now();
        }
    }
}
