<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class mindmap extends Model
{
    use HasFactory;

    protected $fillable = [

        'title',
        'content',
        'connections',
        'positions',
        'editable'

    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
