<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class edges extends Model
{
    protected $fillable = ['mindmap_id', 'from_node_id', 'to_node_id'];

    public function mindmap()
    {
        return $this->belongsTo(mindmaps::class);
    }

    public function fromNode()
    {
        return $this->belongsTo(nodes::class, 'from_node_id');
    }

    public function toNode()
    {
        return $this->belongsTo(nodes::class, 'to_node_id');
    }
}
