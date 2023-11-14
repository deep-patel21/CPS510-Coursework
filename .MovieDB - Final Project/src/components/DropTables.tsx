"use client";

import React from "react";

const DropTables = () => {
  const handler = async () => { 
    let request = await fetch('/app/api/CreateViews.js')
    const data = await request.json()
    console.log(data);
  }

  return (
    <button
      className="border border-white hover:bg-green-500 hover:text-white"
      onClick={handler}
    >
      DropTables
    </button>
  );
};

export default DropTables;
