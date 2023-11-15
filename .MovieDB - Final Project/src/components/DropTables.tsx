'use client';

import React from 'react';

const DropTables = () => {
  const handler = async () => {
    try {
      const response = await fetch('http://localhost:3001/api/DropTables', { method: 'POST' });
      const data = await response.json();
      //console.log(data);
      alert("Successfully dropped tables!");
    } catch (error) {
      console.error(error);
    }
  };

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