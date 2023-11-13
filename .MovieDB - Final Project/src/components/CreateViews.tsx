'use client';

import React from 'react'

const CreateViews = () => {

  const handler = async () => { 
    let request = await fetch('/app/api/CreateViews.js')
    const data = await request.json()
    console.log(data);
  }

  return (
    <button className='border border-white hover:bg-green-500 hover:text-white' onClick={handler}>CreateViews</button>
  )
}

export default CreateViews