<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreedgesRequest;
use App\Http\Requests\UpdateedgesRequest;
use App\Models\edges;

class EdgesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Retrieve all edges
        $edges = edges::all();
        return response()->json($edges);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreedgesRequest $request)
    {
        // Implement validation if needed
        $edge = edges::create($request->all());
        return response()->json($edge, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(edges $edges)
    {
        // Show a specific edge
        return response()->json($edges);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(edges $edges)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateedgesRequest $request, edges $edge)
    {
        // Implement validation if needed
        $edge->update($request->all());
        return response()->json($edge, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(edges $edge)
    {
        // Delete a specific edge
        $edge->delete();
        return response()->json(null, 204);
    }
}
