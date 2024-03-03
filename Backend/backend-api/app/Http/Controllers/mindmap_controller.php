<?php

namespace App\Http\Controllers;

use App\Models\mindmap;
use Illuminate\Http\Request;

class mindmap_controller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($user_id)
    {
        //the user_id should not be retrieved from the front end like that
        $mindmaps = mindmap::where('user_id',$user_id)->select('id','title','connections', 'positions')->get();

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
        mindmap::create([
            // user_id shouldn't be from the request
            'user_id'=> $request ->user_id,
            'title' => $request->title,
            'content' => $request->content,
            'connections' => $request->connections,
            'positions' => $request->positions,
            'editable' => $request->editable

        ]);

    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $single_mindmap = mindmap::where('id',$id)->select('title','content','editable')->get();

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
        mindmap::where('id', $id)->update([

            'title' => $request->title,
            'content' => $request->content,
            'connections' => $request->connections,
            'positions' => $request->positions,
            'editable' => $request->editable

        ]);

        return redirect(route('update'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        mindmap::destroy($id);
    }


//for future improvments (validate and tore images)

    // private function image($request){

    //     $new_image_name = uniqid() . '_' . $request->title . '.'.
    //     $request ->image->extension();

    //     return $request -> image -> move (public_path('images'), $new_image_name);

    // }

}
