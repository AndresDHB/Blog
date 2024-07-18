<?php

namespace App\Models;

use App\Observers\PostObserve;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Support\Facades\Storage;

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

    protected function image() :Attribute
    {
        return new Attribute(
            /* get: fn() => $this->image_path ?? 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg' */

            get: function (){
                if ($this->image_path) {

                    //Verificar si el path empieza con https://
                    if (substr($this->image_path,0, 8) == 'https://') {
                        return $this->image_path;
                    }

                    return Storage::url($this->image_path);
                    
                }else{
                    
                    return 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg';
                }
            }
        );
    }

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
