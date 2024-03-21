<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoremindmapsRequest;
use App\Http\Requests\UpdatemindmapsRequest;
use App\Models\mindmaps;

class MindmapsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Retrieve all mindmaps
        $mindmaps = mindmaps::all();
        return response()->json($mindmaps);
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
    public function store(StoremindmapsRequest $request)
    {
        $mindmap = mindmaps::create($request->all());
        return response()->json($mindmap, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(mindmaps $mindmaps)
    {
        return response()->json($mindmaps);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(mindmaps $mindmaps)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatemindmapsRequest $request, mindmaps $mindmaps)
    {
        // Implement validation if needed
        $mindmaps->update($request->all());
        return response()->json($mindmaps, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(mindmaps $mindmap)
    {
         // Delete a specific mindmap
         $mindmap->delete();
         return response()->json(null, 204);
    }
}
