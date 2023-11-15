"use client"

import React from 'react'

const PopulateTables = () => {

  const handler = async () => { 
    try {
      const response = await fetch('http://localhost:3001/api/PopulateTables', { method: 'POST' });
      const data = await response.json();
      //console.log(data);
      alert("Successfully inserted data!");
    } catch (error) {
      console.error(error);
    }
  }

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white' onClick={handler}>PopulateTables</button>
  )
}

export default PopulateTables