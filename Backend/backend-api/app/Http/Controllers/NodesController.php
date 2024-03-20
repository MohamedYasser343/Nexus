<?php

namespace App\Http\Controllers;

use App\Http\Requests\StorenodesRequest;
use App\Http\Requests\UpdatenodesRequest;
use App\Models\nodes;

class NodesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Retrieve all nodes
        $nodes = nodes::all();
        return response()->json($nodes);
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
    public function store(StorenodesRequest $request)
    {
        // Implement validation if needed
        $node = nodes::create($request->all());
        return response()->json($node, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(nodes $nodes)
    {
         // Show a specific node
         return response()->json($nodes);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(nodes $nodes)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatenodesRequest $request, nodes $node)
    {
         // Implement validation if needed
         $node->update($request->all());
         return response()->json($node, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(nodes $node)
    {
        // Delete a specific node
        $node->delete();
        return response()->json(null, 204);
    }
}
