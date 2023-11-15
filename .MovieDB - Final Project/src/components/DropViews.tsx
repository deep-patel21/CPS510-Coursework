"use client"

import React from 'react'

const DropViews = () => {

  const handler = async () => { 
    try {
      const response = await fetch('http://localhost:3001/api/DropViews', { method: 'POST' });
      const data = await response.json();
      //console.log(data);
      alert("Successfully dropped views!");
    } catch (error) {
      console.error(error);
    }
  }

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white' onClick={handler}>DropViews</button>
  )
}

export default DropViews