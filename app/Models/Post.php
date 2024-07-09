<?php

namespace App\Models;

use App\Observers\PostObserve;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;

#[ObservedBy([PostObserve::class])]
class Post extends Model
{
    use HasFactory;

    protected $casts = ["publicado_at" => "date"];

    protected $fillable = [
        'titulo',
        'slug',
        'cuerpo',
        'resumen',
        'image_path',
        'publicado',
        'category_id',
        'user_id',
        'publicado_at'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function user()
    {
        $this->belongsTo(User::class);
    }

    public function tags()
    {
        return $this->morphToMany(Tag::class, 'taggable');
    }

    public function comments()
    {
        return $this->morphMany(Comment::class, 'commentable');
    }
}
