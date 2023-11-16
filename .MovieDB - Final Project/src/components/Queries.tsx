'use client';

import React from 'react'

const Queries = () => {
  const handler = async () => { 
      try {
        const response = await fetch('http://localhost:3001/api/Query1', { method: 'GET' });
        const data = await response.json();
        let outputcontent = document.getElementById("output");
        if (outputcontent) {
          outputcontent.textContent = data;
        }
        console.log(data);
        alert("Successfully queried data!");
      } catch (error) {
        console.error(error);
      }
    }

  return (
    <div>
      Query
    </div>
  )
}

export default Queries