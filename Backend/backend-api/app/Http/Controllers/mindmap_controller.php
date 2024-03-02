<?php

namespace App\Http\Controllers;

use App\Models\mindmap;
use Illuminate\Http\Request;

class mindmap_controller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $mindmaps = mindmap::select('id','title','connections', 'positions')->get();

        return $mindmaps ->toJson();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $single_mindmap = mindmap::where('id', '==',$id)->select('title','content','editable')->get();

        return $single_mindmap -> toJson();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
