<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class nodes extends Model
{
    protected $fillable = ['mindmap_id', 'title', 'notes', 'image', 'x_position', 'y_position'];

    public function mindmap()
    {
        return $this->belongsTo(mindmaps::class);
    }

    public function edgesFrom()
    {
        return $this->hasMany(edges::class, 'from_node_id');
    }

    public function edgesTo()
    {
        return $this->hasMany(edges::class, 'to_node_id');
    }
}
