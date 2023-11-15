"use client";

import React from "react";

const CreateTables = () => {
  const handler = async () => {
    try {
      const response = await fetch("http://localhost:3001/api/CreateTables", {
        method: "POST",
      });
      const data = await response.json();
      //console.log(data);
      alert("Successfully created tables!");
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <button
      className="border border-white hover:bg-green-500 hover:text-white"
      onClick={handler}
    >
      CreateTables
    </button>
  );
};
export default CreateTables;
